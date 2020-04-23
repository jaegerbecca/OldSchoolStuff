//
//  CardCollectionViewCell.swift
//  Card Match App
//
//  Created by user912125 on 2/26/20.
//  Copyright © 2020 Jaeger. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var frontView: UIImageView!
    
    @IBOutlet weak var backview: UIImageView!
    
    var card:Card?
    
    func setCard(_ card:Card){
        
        //keep track of card passed in
        self.card = card
        
        if card.isMatched == true {
            //if card matched make invisible
            backview.alpha = 0
            frontView.alpha = 0
            
            return
        }else{
            //if card not matched make visible
            backview.alpha = 1
            frontView.alpha = 1
        }
        
        frontView.image = UIImage(named: card.imageName)
        
        //determine if card is flipped up or down
        if card.isFlipped == true{
            //make sure front image is on top
            UIView.transition(from: backview, to: frontView, duration: 0.0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }else{
            //make sure back image is on top
            UIView.transition(from: frontView, to: backview, duration: 0.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        
    }
    
    func flip(){
        
        UIView.transition(from: backview, to: frontView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
    }
    
    func flipBack(flipDelay: Double){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + flipDelay){
        
            UIView.transition(from: self.frontView, to: self.backview, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        
    }
    
    func remove(){
        //hide both imageviews
        backview.alpha = 0
        //animate it
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {self.frontView.alpha = 0}, completion: nil)
    }
    
    
    

    func easeIn(delayTime: Double){
        let currPos = self.center
        self.center.x += 2000
    
        UIView.animate(withDuration: 1.0, delay: delayTime, options: .curveEaseOut, animations: ({
            self.center = currPos
        }), completion: nil)
    }
}
