//
//  TimerControlModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import Foundation

class TimerControl: ObservableObject {
    enum TimerStatus: String, Hashable, CaseIterable, Identifiable {
        case start = "Start"
        case pause = "Pause"
        case resume = "Resume"
        
        var id: String {
            self.rawValue
        }
    }
    
    @Published var isStart: Bool = false
    @Published var timeInterval: Double = 1.0 * 60.0
    @Published var timerStatus: TimerStatus = .pause
    
}
