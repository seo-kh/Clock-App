//
//  RepeatAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/11.
//

import SwiftUI

struct RepeatAlarmView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var repeatDay: [RepeatDays]
    
    var body: some View {
        List(AlarmPeriodEnum.allCases) { alarmPeriod in
            Button {
                repeatDay[AlarmPeriodEnum.allCases.firstIndex(of: alarmPeriod)!].isRepeat.toggle()
            } label: {
                HStack{
                    Text(alarmPeriod.rawValue).foregroundColor(.primary)
                    Spacer()
                    if repeatDay[AlarmPeriodEnum.allCases.firstIndex(of: alarmPeriod)!].isRepeat {
                        Image(systemName: "checkmark")
                    }
                }
            }

        }
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

