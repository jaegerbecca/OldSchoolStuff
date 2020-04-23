//
//  CardModel.swift
//  Card Match App
//
//  Created by user912125 on 2/26/20.
//  Copyright © 2020 Jaeger. All rights reserved.
//

import Foundation

class CardModel{
    
    func getCards(gamemode: String) -> [Card] {
        //declare array to store numbers already generated
        var generatedNumArray = [Int]()
        
        //Declare array to store cards
        var generatedCardArray = [Card]()
        
        if gamemode == "memory"{
            while generatedNumArray.count < 20 {
                
                //get random num
                let randomNum = arc4random_uniform(13) + 1
                
                
                //Log number
                print(randomNum)
                    
                    //store num into generatedNumArray
                    generatedNumArray.append(Int(randomNum))
                
               //create 1st card obj
                let cardOne = Card()
                cardOne.imageName = "card\(randomNum)"
                
                generatedCardArray.append(cardOne)
                                                    
                
                
            }
            //Randomize array
            for i in 0...generatedCardArray.count - 1{
                //find random index to swap with
                let randomNum = Int(arc4random_uniform(UInt32(generatedCardArray.count)))
                
                //swapping the 2 cards
                let tempStorage = generatedCardArray[i]
                generatedCardArray[i] = generatedCardArray[randomNum]
                generatedCardArray[randomNum] = tempStorage
            }
    
        }
        else if gamemode == "match"{
            //Randomly generate pairs of cards
            while generatedNumArray.count < 10 {
                
                //get random num
                let randomNum = arc4random_uniform(13) + 1
                
                //ensure random num is unique
                if generatedNumArray.contains(Int(randomNum)) == false{
                
                //Log number
                print(randomNum)
                    
                    //store num into generatedNumArray
                    generatedNumArray.append(Int(randomNum))
                
               //create 1st card obj
                let cardOne = Card()
                cardOne.imageName = "card\(randomNum)"
                
                generatedCardArray.append(cardOne)
                
                //create 2nd card obj
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNum)"
                
                    generatedCardArray.append(cardTwo)
                    
                }
                
            }
            //Randomize array
            for i in 0...generatedCardArray.count - 1{
                //find random index to swap with
                let randomNum = Int(arc4random_uniform(UInt32(generatedCardArray.count)))
                
                //swapping the 2 cards
                let tempStorage = generatedCardArray[i]
                generatedCardArray[i] = generatedCardArray[randomNum]
                generatedCardArray[randomNum] = tempStorage
            }
            
        }
        
        
        //Return array
        return generatedCardArray
        
    }
}
