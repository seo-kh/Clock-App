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
//        List(AlarmPeriodEnum.allCases) { alarmPeriod in
        List(alarmViewModel.periodLength, id: \.self) { index in
            Button {
                repeatDay[index].toggle()
            } label: {
                HStack{
                    Text(alarmViewModel.getPeriodName(index: index)).foregroundColor(.primary)
                    Spacer()
                    if repeatDay[index] {
                        Image(systemName: "checkmark")
                    }
                }
            } //: BUTTON
        } //: LIST
        .navigationTitle("반복")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("뒤로")
                    }
                }
                
            }
        }
    }
}
