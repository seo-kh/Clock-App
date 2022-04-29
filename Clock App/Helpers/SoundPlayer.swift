//
//  SoundPlayer.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/30.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?
//
//func play(file: String?) {
//    if let fileString = file,
//       let path = Bundle.main.path(forResource: fileString, ofType: nil),
//       let url = URL(string: path) {
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: url)
//            print(url)
//            audioPlayer?.play()
//        } catch {
//            print(error)
//        }
//    } else {
//        return
//    }
//}

func play(file: String?) {
    if let fileString = file,
       let url = Bundle.main.url(forResource: fileString, withExtension: nil) {
        print("fileString: \(fileString)")
        print("url : \(url)")

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
