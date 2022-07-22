//
//  RepeatAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/11.
//

import SwiftUI

struct RepeatAlarmView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var alarmViewModel: AlarmViewModel
    @Binding var repeatDay: [Bool]
    
    var body: some View {
        List(alarmViewModel.periodLength, id: \.self) { index in
            Button {
                repeatDay[index].toggle()
            } label: {
                HStack{
                    Text(alarmViewModel.getPeriodName(index: index)).foregroundColor(.primary)
                    Spacer()
                    if repeatDay[index] { Image(systemName: "checkmark") }
                }
            } //: BUTTON
        } //: LIST
        .modifier(BackButtonModifier(title: "반복"))
    }
}
