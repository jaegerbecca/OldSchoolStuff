//
//  ViewController.swift
//  Card Match App
//
//  Created by user912125 on 3/3/20.
//  Copyright © 2020 Jaeger. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "easy"{
            let vc : ViewController = segue.destination as! ViewController
            vc.milliseconds = 90 * 1000
            vc.gMode = "match"
        }else if segue.identifier == "normal"{
            let vc : ViewController = segue.destination as! ViewController
            vc.milliseconds = 75 * 1000
            vc.gMode = "match"
            
        }else if segue.identifier == "hard"{
            let vc : ViewController = segue.destination as! ViewController
            vc.milliseconds = 55 * 1000
            vc.gMode = "match"
        }
        else if segue.identifier == "memory_game"{
            let vc : ViewController = segue.destination as! ViewController
            vc.milliseconds = 80 * 1000
            vc.gMode = "memory"
        }
        
    }

}
