//
//  AlarmViewModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/15.
//

import SwiftUI

class AlarmViewModel: ObservableObject {
    /// Sound Control and Vibration Control
    @Published var soundNum: Int = 0
    @Published var classicNum: Int = -1
    @Published var vibrationNum: Int = -1
}
