//
//  SoundModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

enum SoundModel: String, Identifiable, CaseIterable {
    var id: String { return self.rawValue }
    
    case clock = "clock"
    case digitalAlarm = "digital-alarm"
    case tone = "tone"
    case alert = "alert"
    case battleShip = "battle-ship"
    case classicAlarm = "classic-alarm"
    case classicShortAlarm = "classic-short-alarm"
    case criticalAlarm = "critical-alarm"
    case digitalBuzzer = "digital-buzzer"
    case emergency = "emergency"
    case facilityAlarm = "facility-alarm"
    case facilityAlarm2 = "facility-alarm2"
    case hall = "hall"
    case space = "space"
    case spaceShip = "spaceShip"
    case street = "street"
    case vintage = "vintage"
}

enum ClassicSoundModel: String, Identifiable, CaseIterable {
    var id: String { return self.rawValue }
    
    case warning = "warning"
    case game = "game"
    case hint = "hint"
    case morning = "morning"
    case retro = "retro"
    case sciFi = "sci-fi"
    case security = "security"
}
