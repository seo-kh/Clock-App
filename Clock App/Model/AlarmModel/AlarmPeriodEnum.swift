//
//  AlarmPeriodEnum.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/11.
//

import Foundation

enum AlarmPeriodEnum: String, Identifiable, CaseIterable {
    case everySun = "일요일마다"
    case everyMon = "월요일마다"
    case everyTue = "화요일마다"
    case everyWed = "수요일마다"
    case everyThu = "목요일마다"
    case everyFri = "금요일마다"
    case everySat = "토요일마다"
    
    var id: String { return self.rawValue }
    static let count: Int = AlarmPeriodEnum.allCases.count
    
    static func getName(index: Int) -> String {
        return AlarmPeriodEnum.allCases[index].rawValue
    }
    
    func getIndex() -> Int {
        return AlarmPeriodEnum.allCases.firstIndex(of: self)!
    }
}

enum AlarmVibrationEnum: String, Identifiable, CaseIterable {
    case fastRepeat = "고속반복"
    case stacato = "스타카토"
    case heartBeat = "심장박동"
    case symphony = "심포니"
    case accent = "악센트"
    case notices = "알림"
    case quick = "퀵"
    case sos = "S.O.S"
    
    var id: String { return self.rawValue}
    static let count: Int = AlarmVibrationEnum.allCases.count
    
    static func getName(index: Int) -> String {
        return AlarmVibrationEnum.allCases[index].rawValue
    }
}
