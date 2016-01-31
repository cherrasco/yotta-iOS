//
//  YottaSoundPlayer.swift
//  Yotta
//
//  Created by Yu Kadowaki on 1/31/16.
//  Copyright © 2016 cherrasco. All rights reserved.
//

import AVFoundation
import Alamofire

class YottaSoundPlayer {
    
    private var player = AVAudioPlayer()
    private var session = AVAudioSession()
    private var connection = TCConnection()
    private var soundUrlArray = Array<NSURL>()
        
    init() {
        let soundPath1 = NSBundle.mainBundle().pathForResource("punch", ofType: "mp3")
        soundUrlArray.append(NSURL(fileURLWithPath: soundPath1!))
        let soundPath2 = NSBundle.mainBundle().pathForResource("kadowaki_yotta", ofType: "mp3")
        soundUrlArray.append(NSURL(fileURLWithPath: soundPath2!))

        do {
            // NOTE: とりあえず初期化
            player = try AVAudioPlayer(contentsOfURL: soundUrlArray.first!)
        } catch {
            print("sound error = \(error)")
        }
    }
    
    // NOTE: ランダムで音楽を流してるけどパフォーマンスに影響出たらやめます笑
    internal func playYottaSound() {
        let randomNumber = arc4random_uniform(UInt32(soundUrlArray.count))
        let randomSoundUrl = soundUrlArray[Int(randomNumber)]

        do {
            player = try AVAudioPlayer(contentsOfURL: randomSoundUrl)
        } catch {
            print("sound error = \(error)")
        }

        player.play()
    }
}