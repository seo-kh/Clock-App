//
//  AlarmCellView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/11.
//

import SwiftUI

struct AlarmCellView: View {
    // MARK: - PROPERTIES

    @ObservedObject var alarm: Alarm
//    @Binding var crudAlarm: Bool
    @Binding var crudState: CRUDState?
    
    var repeatDays: String {
        let dayCount: Int = alarm.repeatDay?.filter { $0 }.count ?? 0
        guard let label = alarm.label else { return "알람" }
        
        switch dayCount {
        case 0:
            return label
        case 1:
            return label + ", " + parsingOneDay()
        case 7:
            return label + ", 매일"
        default:
            return label + ", " + parsingDays()
        }
    }

    
    // MARK: - BODY

    var body: some View {
        Button {
//            crudAlarm = true
            crudState = .edit
        } label: {
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 5) {
                    // MARK: - AM | PM
                    Text(alarm.time ?? .now, formatter: merediemDateFormatter)
                        .font(.system(size: 25, weight: .light, design: .default))
                        .offset(y: 10)
                    
                    // MARK: - TIME
                    Text(alarm.time ?? .now, formatter: alarmTimeFormatter)
                        .font(.system(size: 40, weight: .light, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: - NOTIFICATION AGAIN
                    Toggle(isOn: $alarm.notice)
                    {
                        //
                    }.fixedSize(horizontal: false, vertical: true)
                } //: HSTACK
                
                // MARK: - LABEL
                Text(repeatDays).offset(y: -10).fixedSize()
            } //: VSTACK
            .foregroundColor(alarm.notice ? .primary : .secondary)
        } //: BUTTON

    }
    
    private func parsingOneDay() -> String {
        var newDay: String = ""
        for (day, selected) in zip(AlarmPeriodEnum.allCases, alarm.repeatDay!) {
            if selected { newDay = day.rawValue }
        }
        return newDay
    }
    private func parsingDays() -> String {
        var days: String = ""
        for (day, selected) in zip(AlarmPeriodEnum.allCases, alarm.repeatDay!) {
            if selected {
                days += "\(day.rawValue.first!) "
            }
        }
        return days
    }

}

