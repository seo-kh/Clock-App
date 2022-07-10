//
//  RepeatAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/11.
//

import SwiftUI

struct RepeatAlarmView: View {
    var body: some View {
        List(AlarmPeriodEnum.allCases) { alarmPeriod in
            Text(alarmPeriod.rawValue)
        }
        .navigationTitle("반복")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RepeatAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        RepeatAlarmView()
    }
}
