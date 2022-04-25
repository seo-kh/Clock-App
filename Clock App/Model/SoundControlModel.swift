//
//  SoundControlModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

class SoundControl: ObservableObject {
    @Published var soundPack: [SoundData] = [
        SoundData(name: "Radar (Default)", isSelected: true),
        SoundData(name: "Apex", isSelected: false),
        SoundData(name: "Beacon", isSelected: false),
        SoundData(name: "Bulletin", isSelected: false),
        SoundData(name: "By The Seaside", isSelected: false),
        SoundData(name: "Chimes", isSelected: false),
        SoundData(name: "Circuit", isSelected: false),
        SoundData(name: "Constellation", isSelected: false),
        SoundData(name: "Cosmic", isSelected: false),
        SoundData(name: "Crystals", isSelected: false),
        SoundData(name: "Hillside", isSelected: false),
        SoundData(name: "Classic", isSelected: false),
    ]
}
