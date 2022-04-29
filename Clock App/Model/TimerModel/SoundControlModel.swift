//
//  SoundControlModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

class SoundControl: ObservableObject {
    @Published var isClick: Bool = false
    @Published var soundPack: [SoundData] = [
        SoundData(name: "clock", soundPath: "mixkit-alarm-clock-beep-988.wav"),
        SoundData(name: "digital clock", soundPath: "mixkit-alarm-digital-clock-beep-989.wav"),
        SoundData(name: "tone", soundPath: "mixkit-alarm-tone-996.wav"),
        SoundData(name: "alert", soundPath: "mixkit-alert-alarm-1005.wav"),
        SoundData(name: "battleship", soundPath: "mixkit-battleship-alarm-1001.wav"),
        SoundData(name: "classic alarm", soundPath: "mixkit-classic-alarm-995.wav"),
        SoundData(name: "classic short alarm", soundPath: "mixkit-classic-short-alarm-993.wav"),
        SoundData(name: "critical alarm", soundPath: "mixkit-critical-alarm-1004.wav"),
        SoundData(name: "digital buzzer", soundPath: "mixkit-digital-clock-digital-alarm-buzzer-992.wav"),
        SoundData(name: "emergency", soundPath: "mixkit-emergency-alert-alarm-1007.wav"),
        SoundData(name: "facility alarm", soundPath: "mixkit-facility-alarm-908.wav"),
        SoundData(name: "facility alarm2", soundPath: "mixkit-facility-alarm-sound-999.wav"),
        SoundData(name: "hall", soundPath: "mixkit-sound-alert-in-hall-1006.wav"),
        SoundData(name: "space", soundPath: "mixkit-space-shooter-alarm-1002.wav"),
        SoundData(name: "spaceship", soundPath: "mixkit-spaceship-alarm-998.wav"),
        SoundData(name: "street", soundPath: "mixkit-street-public-alarm-997.wav"),
        SoundData(name: "vintage", soundPath: "mixkit-vintage-warning-alarm-990.wav"),
        SoundData(name: "classic"),
    ]
    
    @Published var classicSoundPack: [SoundData] = [
        SoundData(name: "warning", soundPath: "mixkit-warning-alarm-buzzer-991.wav"),
        SoundData(name: "game", soundPath: "mixkit-game-notification-wave-alarm-987.wav"),
        SoundData(name: "hint", soundPath: "mixkit-interface-hint-notification-911.wav"),
        SoundData(name: "morning", soundPath: "mixkit-morning-clock-alarm-1003.wav"),
        SoundData(name: "retro", soundPath: "mixkit-retro-game-emergency-alarm-1000.wav"),
        SoundData(name: "sci-fi", soundPath: "mixkit-scanning-sci-fi-alarm-905.wav"),
        SoundData(name: "security", soundPath: "mixkit-security-facility-breach-alarm-994.wav"),
    ]
}
