//
//  SoundModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

enum SoundModel: String, Identifiable, CaseIterable {
    var id: String { return self.rawValue }
    
    case siren = "siren"
    case carOrHome = "car or home"
    case clockShort = "clock short"
    case clockTicking = "clock ticking"
    case no3 = "no3"
    case policeFire = "police fire"
    case beepBeep = "beep beep"
    case beepWarning = "beep warning"
    case cinematicAlarm = "cinematic alarm"
    case clockAlarm1 = "clock alarm1"
    case clockAlarm2 = "clock alarm2"
    case darkSitar = "dark sitar"
    case emergency = "emergency"
    case futuristic = "futuristic"
    case germanAmbulance = "german ambulance"
    case machineError = "machine error"
    case militaryAlarm = "military alarm"
}

enum ClassicSoundModel: String, Identifiable, CaseIterable {
    var id: String { return self.rawValue }
    
    case nuclearAlarm = "nuclear alarm"
    case offHook = "off-hook"
    case oversimplifiedAlarm = "over simplified alarm"
    case psycho = "psycho"
    case destructSequence = "destruct sequence"
    case smartphoneVibration = "smart phone vibration"
    case clockStrick = "clock strick"
    case ticTac = "tic-tac"
    
}
