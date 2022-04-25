//
//  SoundControlModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

class SoundControl: ObservableObject {
    @Published var soundPack: [SoundData] = [
        SoundData(name: "Default", isSelected: true),
        SoundData(name: "0", isSelected: false),
        SoundData(name: "1", isSelected: false),
        SoundData(name: "2", isSelected: false),
        SoundData(name: "3", isSelected: false),
        SoundData(name: "4", isSelected: false),
        SoundData(name: "5", isSelected: false),
        SoundData(name: "6", isSelected: false),
        SoundData(name: "7", isSelected: false),
        SoundData(name: "8", isSelected: false),
        SoundData(name: "9", isSelected: false),
    ]
    
    @Published var prevIndex: Int = 0
    @Published var currentIndex: Int = 0
}
