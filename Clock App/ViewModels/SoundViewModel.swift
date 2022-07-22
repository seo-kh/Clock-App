//
//  soundViewModelModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

class SoundViewModel: ObservableObject {
    
    @Published var isClick: Bool = false
    @Published var soundPack = SoundModel.allCases
    @Published var classicSoundPack = ClassicSoundModel.allCases
    
    var soundCounts: Range<Int> { return 0..<soundPack.count }
    var soundPackLength: Int { return soundPack.count }
    func getSoundName(index: Int) -> String { return soundPack[index].rawValue }
    
    var classicCounts: Range<Int> { return 0..<classicSoundPack.count }
    var classicPackLength: Int { return classicSoundPack.count }
    func getClassicName(index: Int) -> String { return classicSoundPack[index].rawValue }
}
