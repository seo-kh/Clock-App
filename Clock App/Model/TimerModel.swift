//
//  TimerModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/29.
//

import Foundation

class TimerModel: ObservableObject {
    @Published var timerControl = TimerControl()
    @Published var soundControl = SoundControl()
}
