//
//  SoundManager.swift
//  Card Match App
//
//  Created by user912125 on 2/27/20.
//  Copyright © 2020 Jaeger. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager{
    
    var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
    func playSound(_ effect:SoundEffect){
        
        var soundFilename = ""
        
        //determine which sounde effect to play and set filename
        switch effect {
        case .flip:
            soundFilename = "cardflip"
        case .shuffle:
            soundFilename = "shuffle"
        case .match:
            soundFilename = "dingcorrect"
        case .nomatch:
            soundFilename = "dingwrong"
        }
        
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find sound file \(soundFilename) in the bundle")
            return
        }
        
        //create obj from string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do{
        //create audio player obj
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        
        //play the sound
        audioPlayer?.play()
        }
        catch{
            //couldn't creat audioplayer obj, log error
            print("Couldn't create audio player object for sound file \(soundFilename)")
        }
        
    }
    
}
