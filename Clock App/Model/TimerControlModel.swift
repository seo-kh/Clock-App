//
//  TimerControlModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import Foundation

class TimerControl: ObservableObject {
    @Published var isStart: Bool = false
    @Published var timeInterval: Double = 1.0 * 60.0
}
