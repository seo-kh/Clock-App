//
//  ClassicSoundAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/15.
//

import SwiftUI

struct ClassicSoundAlarmView: View {
    @ObservedObject var soundControlModel: SoundControl
    @EnvironmentObject var alarmSoundModel: AlarmSoundModel

    var body: some View {
        List(0..<soundControlModel.classiCount, id: \.self) {
            num in
            Button {
                alarmSoundModel.classicNum = num
            } label: {
                HStack {
                    Image(systemName: "checkmark")
                        .foregroundColor(.accentColor)
                        .frame(width: 30, height: 30)
                        .opacity(alarmSoundModel.classicNum == num ? 1 : 0)
                    Text(soundControlModel.classicSoundPack[num].name)
                } //: HSTACK
            }.tint(.primary)

        } //: LIST
        .navigationTitle("클래식")
    }
}

