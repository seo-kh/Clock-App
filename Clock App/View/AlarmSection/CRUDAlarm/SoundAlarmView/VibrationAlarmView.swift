//
//  VibrationAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/17.
//

import SwiftUI

struct VibrationAlarmView: View {
    @EnvironmentObject var alarmSoundModel: AlarmViewModel
    
    var body: some View {
        List {
            
            // MARK: - 기본 설정

            Section {
                customListCell(title: "동기화됨 (기본 설정)", idx: -1)
            } //: SECTION1
            
            // MARK: - 표준
            
            Section {
                ForEach(0..<AlarmVibrationEnum.count, id: \.self) { idx in
                    customListCell(title: AlarmVibrationEnum.getName(index: idx), idx: idx)
                }
            } header: {
                Text("표준")
            } //: SECTION2

            // MARK: - 사용자화
            
            Section {
                ForEach(0..<1, id: \.self) { idx in
                    let num: Int = AlarmVibrationEnum.count
                    customListCell(title: "새로운 진동 생성", idx: num+idx)
                }
            } header: {
                Text("사용자화")
            } //: SECTION3
            
            // MARK: - 없음
            
            Section {
                customListCell(title: "없음", idx: -2)
            }



        } //: LIST
    }
    
    @ViewBuilder
    func customListCell(title: String, idx: Int) -> some View {
        Button {
            alarmSoundModel.vibrationNum = idx
        } label: {
            HStack {
                Text(title)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
                    .frame(width: 30, height: 30)
                    .opacity(alarmSoundModel.vibrationNum == idx ? 1 : 0)
            }
        }
    }
}
