//
//  AlarmViewModel.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/15.
//

import SwiftUI

class AlarmViewModel: ObservableObject {
    /// Sound Control and Vibration Control
    @Published var isClick: Bool = false
    @Published var soundNum: Int = 0
    @Published var classicNum: Int = -1
    @Published var vibrationNum: Int = -1
    @Published var alarmVibration = AlarmVibrationEnum.allCases
    /// Alarm Repeat control
    @Published var alarmPeriod = AlarmPeriodEnum.allCases
    
    /// Alarm View Control
    @Published var isSetting: Bool = false
    @Published var crudState: CRUDState? = nil
    @Published var editableAlarm: Alarm? = nil
    
    func settingButton() { isSetting = true }
    func createButton() { crudState = .create }
    
    /// Alarm
    
    var periodCount: Int { return alarmPeriod.count }
    var periodLength: Range<Int> { return 0..<periodCount }
    func getPeriodName(index: Int) -> String {
        return alarmPeriod[index].rawValue
    }
    func getPeriodIndex(period: AlarmPeriodEnum) -> Int {
        return alarmPeriod.firstIndex(of: period)!
    }
    
    /// Vibration
    
    var vibrationCount: Int { return alarmVibration.count }
    var vibrationLength: Range<Int> { return 0..<vibrationCount }
    func getVibrationName(index: Int) -> String {
        return alarmVibration[index].rawValue
    }
    func getVibrationIndex(vibration: AlarmVibrationEnum) -> Int {
        return alarmVibration.firstIndex(of: vibration)!
    }
}
