//
//  ViewController.swift
//  blackjack21
//
//  Created by Chang Sophia on 2018/7/5.
//  Copyright © 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ttlLabel: UILabel!
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var hitBTN: UIButton!
    @IBOutlet weak var openBTN: UIButton!
    

    
    var lightOn = true
    var cardNum = [0,1,2,3,4,5,6,7,8,9,10,11,12,13]
    var point = 0
    var index = 0
    var sum = 0
    var value = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        index = Int(arc4random_uniform(UInt32(cardNum.count)))
        bg.image = UIImage(named:"\(index)")
        ttlLabel.isHidden = false
    }
    
    
@IBAction func hitBTN(_ sender: Any) {
        sum = sum + index
        ttlLabel.text = "point: \(sum)"
    if sum == 21 {
        let alertController = UIAlertController(
            title: "Balckjack!",
            message: "Welcome to Harvard!",
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "You can start all over again",
                                     style: .default,
                                     handler:{
                                        (action: UIAlertAction!) -> Void in
                                        self.initialize()
                                        self.updateUI()
                                        self.ttlLabel.isHidden = true
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    if sum > 21 {
        let alertController = UIAlertController(
            title: "Bust!",
            message: "Professor Micky took all money!",
            preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "You can start all over again",
                                     style: .default,
                                     handler:{
                                        (action: UIAlertAction!) -> Void in
                                        self.initialize()
                                        self.updateUI()
                                        self.ttlLabel.isHidden = true
                                        
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
        updateUI()
    }
    
    
    @IBAction func openBTN(_ sender: Any) {
       
        if sum <= 20 && sum >= 17 {
            let alertController = UIAlertController(
                title: "Tie!",
                message: "Winner, Winner, Chicken Closer!",
                preferredStyle: .alert)
            
            
            let okAction = UIAlertAction(title: "You can start all over again",
                                         style: .default,
                                         handler:{
                                            (action: UIAlertAction!) -> Void in
                                            self.initialize()
                                            self.updateUI()
                                            self.ttlLabel.isHidden = true
                                            
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        else {
            let alertController = UIAlertController(
                title: "Lose!",
                message: "Go back to school and study harder!",
                preferredStyle: .alert)
            
            
            let okAction = UIAlertAction(title: "You can start all over again",
                                         style: .default,
                                         handler:{
                                            (action: UIAlertAction!) -> Void in
                                            self.initialize()
                                            self.updateUI()
                                            self.ttlLabel.isHidden = true
                                            
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
            
    }
    }
    
    func initialize()
    {
        cardNum = [0,1,2,3,4,5,6,7,8,9,10,11,12,13]
        sum = 0
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


