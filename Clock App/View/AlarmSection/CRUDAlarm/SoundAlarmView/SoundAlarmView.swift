//
//  SoundAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/15.
//

import SwiftUI

struct SoundAlarmView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var alarmSoundModel: AlarmSoundModel
    @Environment(\.dismiss) var dismiss
    @ObservedObject var soundControlModel: SoundControl
    
    @State private var songSelect: Bool = false
    var vibration: String {
        switch alarmSoundModel.vibrationNum {
        case -1:
            return "동기화됨 (기본 설정)"
        case AlarmVibrationEnum.count:
            return "새로운 진동 패턴"
        case -2:
            return "없음"
        default:
            return AlarmVibrationEnum.getName(index: alarmSoundModel.vibrationNum)
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        List {
            // MARK: - 진동 선택
            Section {
                NavigationLink {
                    VibrationAlarmView()
                } label: {
                    HStack {
                        Text("진동")
                        Spacer()
                        Text(vibration)
                            .foregroundColor(.secondary)
                    }
                }
            } //: VIBRATION SECTION
            
            // MARK: - 노래 선택
            Section {
                Button {
                    songSelect = true
                    alarmSoundModel.soundNum = -1
                } label: {
                    HStack {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                            .frame(width: 30, height: 30)
                            .opacity(alarmSoundModel.soundNum == -1 ? 1 : 0)
                        Text("노래 선택")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                            .foregroundColor(.secondary.opacity(0.5))
                            .frame(width: 7, height: 7)
                            .padding(3)
                    }
                    .tint(.primary)
                }
            } header: {
                Text("노래")
            } //: SONG SECTION
            
            // MARK: - 벨소리 선택
            Section {
                ForEach(0..<soundControlModel.soundCount-1, id: \.self) {
                    num in
                    
                    // MARK: - SOUND
                    Button {
                        alarmSoundModel.soundNum = num
                    } label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(.accentColor)
                                .frame(width: 30, height: 30)
                                .opacity(alarmSoundModel.soundNum == num ? 1 : 0)
                            Text(soundControlModel.soundPack[num].name)
                        }
                    }.tint(.primary)
                }
                
                // MARK: - CLASSIC
                    NavigationLink {
                        ClassicSoundAlarmView(soundControlModel: soundControlModel)
                            .onAppear {
                                alarmSoundModel.soundNum = soundControlModel.soundCount-1
                            }
                            .environmentObject(alarmSoundModel)
                    } label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(.accentColor)
                                .frame(width: 30, height: 30)
                                .opacity(alarmSoundModel.soundNum == soundControlModel.soundCount-1 ? 1 : 0)
                            Text(soundControlModel.soundPack.last?.name ?? "classic")
                            Spacer()
                            if alarmSoundModel.classicNum != -1 {
                                Text(soundControlModel.classicSoundPack[alarmSoundModel.classicNum].name)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                
            } header: {
                Text("벨소리")
            } //: BELL SOUND SECTION
            
            // MARK: - 없음
            Button {
                alarmSoundModel.soundNum = soundControlModel.soundCount
            } label: {
                HStack {
                    Image(systemName: "checkmark")
                        .foregroundColor(.accentColor)
                        .opacity(alarmSoundModel.soundNum == soundControlModel.soundCount ? 1 : 0)
                        .frame(width: 30, height: 30)
                    Text("없음")
                }
            } //: NONE
            .tint(.primary)
            
        } //: LIST
        .listStyle(.insetGrouped)
        .navigationTitle("사운드")
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $songSelect, content: {
            SongAlarmView()
        })
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

