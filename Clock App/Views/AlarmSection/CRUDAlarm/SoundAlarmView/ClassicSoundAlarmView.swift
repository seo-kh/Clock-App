//
//  ClassicSoundAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/15.
//

import SwiftUI

struct ClassicSoundAlarmView: View {
    @ObservedObject var soundViewModel: SoundViewModel
    @EnvironmentObject var alarmSoundModel: AlarmViewModel

    var body: some View {
        List(soundViewModel.classicCounts, id: \.self) {
            num in
            Button {
                if !alarmSoundModel.isClick || alarmSoundModel.classicNum != num {
                    play(file: soundViewModel.getClassicName(index: num))
                    alarmSoundModel.classicNum = num
                    alarmSoundModel.isClick = true
                } else {
                    stop()
                    alarmSoundModel.isClick = false
                }
            } label: {
                HStack {
                    Image(systemName: "checkmark")
                        .foregroundColor(.accentColor)
                        .frame(width: 30, height: 30)
                        .opacity(alarmSoundModel.classicNum == num ? 1 : 0)
                    Text(soundViewModel.getClassicName(index: num))
                } //: HSTACK
            }.tint(.primary)

        } //: LIST
        .navigationTitle("클래식")
    }
}

