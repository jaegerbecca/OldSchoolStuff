//
//  ViewController.swift
//  Card Match App
//
//  Created by user912125 on 2/26/20.
//  Copyright © 2020 Jaeger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var timerLabel: UILabel!
       
    @IBOutlet weak var FindLabel: UILabel!
    
    var model = CardModel()
    var cardArray = [Card]()
    var firstFlip:IndexPath?
    var cellArray = [IndexPath]()
    var gMode = ""
    var findCard = Card()
    var canFlip = false
    
    var timer:Timer?
    var milliseconds:Float = 60 * 1000
        
    var soundManager = SoundManager()
    @IBOutlet weak var waldoCard: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
               // call the getCards method of card model
        cardArray = model.getCards(gamemode: gMode)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        if gMode == "match"{
            FindLabel.isHidden = true
        }
        else if gMode == "memory"{
            FindLabel.isHidden = false
        }
        
        
        //create timer
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.5){
            self.timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.timerElapsed), userInfo: nil, repeats: true)
            RunLoop.main.add(self.timer!, forMode: .common)
            self.canFlip = true
        }
    }
    
    
        override func viewDidAppear(_ animated: Bool){
            
            soundManager.playSound(.shuffle)
            

            var i = 0.0
            
            if gMode == "match"{
                cellArray.forEach {(cellPath) in
                    let cell = collectionView.cellForItem(at: cellPath) as! CardCollectionViewCell
                    
                    cell.easeIn(delayTime: i)
                    i+=0.25
                }
                
            }
            else if gMode == "memory"{
                cellArray.forEach {(cellPath) in
                    let cell = collectionView.cellForItem(at: cellPath) as! CardCollectionViewCell
                    let card = cardArray[cellPath.row]
                    cell.flip()
                    cell.flipBack(flipDelay: 5.5)
                    let randNum = Int.random(in: 0 ..< cardArray.count)
                    findCard = cardArray[randNum]
                    waldoCard.image = UIImage(named: findCard.imageName)
                    
                }
                
            }
            
            
            
        }
        
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }
    
    //MARK: -Timer Methods
    
    @objc func timerElapsed(){
            milliseconds -= 1
                            
            //convert to seconds
            let seconds = String(format: "%.2f", milliseconds/1000)
            
            //set label
            timerLabel.text = "Time Remaining: \(seconds)"
            
            //stop timer when hit 0
            if milliseconds <= 0 {
                
                timer?.invalidate()
                timerLabel.textColor = UIColor.red
                
                //check if any cards unmatched
                checkGameEnded()
                
        }
        
        
    
    }

    //MARK: -UICollectionView Protocol Methods
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        //get CardCollectionViewCell obj
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        //get card collection view trying to display
        let card = cardArray[indexPath.row]
        
        //set card for cell
        cell.setCard(card)
        
        cellArray.append(indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //check if any time left
        if milliseconds <= 0 {
        return
        }
        
        //get selected cell
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        //get selected card
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false{
        //flip card
            if canFlip == true {
            cell.flip()
            }
            
            //play flip sound
            soundManager.playSound(.flip)
            
            //set card status
            card.isFlipped = true
            
            if gMode=="match"{
                //determine if 1st or 2nd card flipped
                if firstFlip == nil{
                    //1st card flip
                    firstFlip = indexPath
                }else{
                    //2nd card flipped
                    //matchinglogic
                    checkForMatches(indexPath)
                }
            }
            else if gMode == "memory"{
                checkForMatches(indexPath)
            }
            
        }
    }//end didSelectItemAt method
    
    
    //MARK: -Game logic methods
    
    func checkForMatches(_ secondFlip:IndexPath){
        
        if gMode == "match"{
            //get cells for 2 revealed cards
            let cardOneCell = collectionView.cellForItem(at: firstFlip!) as? CardCollectionViewCell
            
            let cardTwoCell = collectionView.cellForItem(at: secondFlip) as? CardCollectionViewCell
            
            //get cards for 2 revealed cards
            let cardOne = cardArray[firstFlip!.row]
            let cardTwo = cardArray[secondFlip.row]
            
            //compare cards
            if cardOne.imageName == cardTwo.imageName{
                //it's a match
                
                //play match sound
                soundManager.playSound(.match)
                
                //set statuses of cards
                cardOne.isMatched = true
                cardTwo.isMatched = true
                
                //remove cards from grid
                cardOneCell?.remove()
                cardTwoCell?.remove()
                
                //check if any cards left unmatched
                checkGameEnded()
                
            }else{
                //not a match
                
                //play no match sound
                soundManager.playSound(.nomatch)
                
                //set statuses of cards
                cardOne.isFlipped = false
                cardTwo.isFlipped = false
                //flip cards back over
                cardOneCell?.flipBack(flipDelay: 0.8)
                cardTwoCell?.flipBack(flipDelay: 0.8)
                
            }
            //tell collectionView to reload cell of 1st card if nil
            if cardOneCell == nil {
                collectionView.reloadItems(at: [firstFlip!])
            }
            //reset property that tracks 1st flip
            firstFlip = nil
            
        }
        else if gMode == "memory"{
            //get cell for revealed card
            let cardTwoCell = collectionView.cellForItem(at: secondFlip) as? CardCollectionViewCell
            
            // set cards
            let cardOne = findCard
            let cardTwo = cardArray[secondFlip.row]
            
            //compare cards
            if cardOne.imageName == cardTwo.imageName{
                //it's a match
                
                //play match sound
                soundManager.playSound(.match)
                
                //set statuses of cards
                
                cardTwo.isMatched = true
                
                //remove cards from grid
                cardTwoCell?.remove()
                
                var randNum = Int.random(in: 0 ..< cardArray.count)
                var matchedCards = 0
                
                cardArray.forEach{(card) in
                    if card.isMatched{
                        matchedCards += 1
                    }
                }
                if matchedCards < cardArray.count{
                    while cardArray[randNum].isMatched{
                        randNum = Int.random(in: 0 ..< cardArray.count)
                    }
                        findCard = cardArray[randNum]
                        waldoCard.image = UIImage(named: findCard.imageName)
                    
                }
                
                
                
                
                //check if any cards left unmatched
                checkGameEnded()
                
            }else{
                //not a match
                
                //play no match sound
                soundManager.playSound(.nomatch)
                
                //set statuses of cards
                cardTwo.isFlipped = false
                //flip cards back over
                cardTwoCell?.flipBack(flipDelay: 0.8)
                
                
            }
            
        }
        
        
    }
    
    func checkGameEnded(){
        
        //determine if any cards unmatched
        var isWon = true
        
        for card in cardArray{
            
            if card.isMatched == false {
                isWon = false
                break
            }
            
        }
        //messaging variables
        var title = ""
        var message = ""
        
        //if not, user has won, stop timer
        if isWon == true {
            
            if milliseconds > 0 {
                timer?.invalidate()
                timerLabel.textColor = UIColor.red
            }
            
            title = "Congratulations!"
            message = "You win"
            
        } else{
            //if still unmatched cards check time left
            if milliseconds > 0{
                return
            }
            title = "Game Over"
            message = "You Lose"
            
        }
        
        //show won/lost message
        showAlert(title, message)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "main_menu"{
            self.close()
        }
        
    }
    func showAlert(_ title:String, _ message:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: {action in self.close()})
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func close(){
        
        dismiss(animated: true, completion: nil)
        
    }
}//end ViewController class

