//
//  AlarmSoundModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/15.
//

import SwiftUI

class AlarmSoundModel: ObservableObject {
    @Published var soundNum: Int = 0
    @Published var classicNum: Int = -1
}
