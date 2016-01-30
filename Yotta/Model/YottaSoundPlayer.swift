//
//  YottaSoundPlayer.swift
//  Yotta
//
//  Created by Yu Kadowaki on 1/31/16.
//  Copyright © 2016 cherrasco. All rights reserved.
//

import AVFoundation

class YottaSoundPlayer {
    
    private var player = AVAudioPlayer()
        
    init() {
        let soundPath = NSBundle.mainBundle().pathForResource("punch", ofType: "mp3")
        let soundUrl = NSURL(fileURLWithPath: soundPath!)

        do {
            player = try AVAudioPlayer(contentsOfURL: soundUrl)
        } catch {
            print("sound error = \(error)")
        }
    }
    
    internal func playYottaSound() {
        player.play()
    }
}