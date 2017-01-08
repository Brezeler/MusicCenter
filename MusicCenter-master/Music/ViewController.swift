//
//  ViewController.swift
//  Music
//
//  Created by Jordan Sejean  on 28/11/2016.
//  Copyright © 2016 Brezeler. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
     private var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let musicUrl = Bundle.main.url(forResource: "Pokemon", withExtension: "mp3"){
            if let player = try? AVAudioPlayer(contentsOf: musicUrl){
                player.play()
                player.numberOfLoops = -1
                player.currentTime = 10
                self.player = player
            }
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

