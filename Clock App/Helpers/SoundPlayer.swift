//
//  SoundPlayer.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/30.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func play(file: String?) {
    if let fileString = file,
       let url = Bundle.main.url(forResource: fileString, withExtension: ".wav") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    } else {
        return
    }
}

func stop() {
    audioPlayer?.stop()
}
