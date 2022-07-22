//
//  AlarmDataModel.swift
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
    
    var id: String { self.rawValue }
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
    
    var id: String { self.rawValue }
}
