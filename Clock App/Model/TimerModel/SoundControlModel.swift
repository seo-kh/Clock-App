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
    
    @Published var classicSoundPack: [SoundData] = [
        SoundData(name: "개 짓는 소리", isSelected: true),
        SoundData(name: "경보기", isSelected: true),
        SoundData(name: "공 튀기는 소리", isSelected: true),
        SoundData(name: "공상과학", isSelected: true),
        SoundData(name: "구식 자동차 경적", isSelected: true),
        SoundData(name: "귀뚜라미 소리", isSelected: true),
        SoundData(name: "기계음", isSelected: true),
        SoundData(name: "기타", isSelected: true),
        SoundData(name: "로보트 소리", isSelected: true),
        SoundData(name: "마림바", isSelected: true),
        SoundData(name: "블루스", isSelected: true),
    ]
}
