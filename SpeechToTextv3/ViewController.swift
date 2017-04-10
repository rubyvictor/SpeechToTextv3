//
//  ViewController.swift
//  SpeechToTextv3
//
//  Created by Victor Lee on 8/2/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit
import SpeechKit


class ViewController: UIViewController, SKTransactionDelegate {

    @IBOutlet var recordButton: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func buttonClicked(_ sender: Any) {
        recordButton.setTitle("Listening", for: .normal)
        let session = SKSession(url: NSURL(string: "") as URL!, appToken: "")
        session?.recognize(withType: SKTransactionSpeechTypeDictation,
                           detection: .long,
                           language: "eng-USA",
                           delegate: self)
    }
    
    func transaction(_ transaction: SKTransaction!, didReceive recognition: SKRecognition!) {
        resultLabel.text = recognition.text
        recordButton.setTitle("Listen", for: .normal)
    }
    
    func transactionDidFinishRecording(_ transaction: SKTransaction!) {
        recordButton.setTitle("Done Listening", for: .normal)
    }
    
}

