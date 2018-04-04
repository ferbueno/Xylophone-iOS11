//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var audioPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        let noteSound = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav")
        playSound(noteUrl: noteSound!)
    }
    
    func playSound(noteUrl: URL){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: noteUrl)
            guard let audioPlayer = audioPlayer else { return }
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
}

