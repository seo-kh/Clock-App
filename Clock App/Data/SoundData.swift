//
//  SoundData.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

struct SoundData: Identifiable {
    var id = UUID()
    var name: String
    var soundPath: String? = nil
}
