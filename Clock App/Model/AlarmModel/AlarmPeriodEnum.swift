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
}
