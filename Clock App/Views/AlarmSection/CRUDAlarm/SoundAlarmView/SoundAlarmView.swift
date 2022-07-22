//
//  SoundAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/15.
//

import SwiftUI

struct SoundAlarmView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var alarmViewModel: AlarmViewModel
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var soundViewModel: SoundViewModel
    
    @State private var songSelect: Bool = false
    @State private var soundOn: Bool = false
    var vibration: String {
        switch alarmViewModel.vibrationNum {
        case -1:
            return "동기화됨 (기본 설정)"
        case alarmViewModel.vibrationCount:
            return "새로운 진동 패턴"
        case -2:
            return "없음"
        default:
            return alarmViewModel.getVibrationName(index: alarmViewModel.vibrationNum)
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
                    alarmViewModel.soundNum = -1
                    
                    // music stop
                    stop()
                } label: {
                    HStack {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                            .frame(width: 30, height: 30)
                            .opacity(alarmViewModel.soundNum == -1 ? 1 : 0)
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
                ForEach(0..<soundViewModel.soundPackLength-1, id: \.self) {
                    num in
                    
                    // MARK: - SOUND
                    Button {
                        if !alarmViewModel.isClick || alarmViewModel.soundNum != num {
                            play(file: soundViewModel.getSoundName(index: num))
                            alarmViewModel.soundNum = num
                            alarmViewModel.isClick = true
                        } else {
                            stop()
                            alarmViewModel.isClick = false
                        }
                    } label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(.accentColor)
                                .frame(width: 30, height: 30)
                                .opacity(alarmViewModel.soundNum == num ? 1 : 0)
                            Text(soundViewModel.getSoundName(index: num))
                        }
                    }.tint(.primary)
                }
                
                // MARK: - CLASSIC
                    NavigationLink {
                        ClassicSoundAlarmView(soundViewModel: soundViewModel)
                            .onAppear {
                                stop()
                                alarmViewModel.soundNum = soundViewModel.soundPackLength-1
                            }
                            .onDisappear(perform: stop)
                            .environmentObject(alarmViewModel)
                    } label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(.accentColor)
                                .frame(width: 30, height: 30)
                                .opacity(alarmViewModel.soundNum == soundViewModel.soundPackLength-1 ? 1 : 0)
                            Text("classic")
                            Spacer()
                            if alarmViewModel.classicNum != -1 {
                                Text(soundViewModel.getClassicName(index: alarmViewModel.classicNum))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                
            } header: {
                Text("벨소리")
            } //: BELL SOUND SECTION
            
            // MARK: - 없음
            Button {
                alarmViewModel.soundNum = soundViewModel.soundPackLength
                stop()
            } label: {
                HStack {
                    Image(systemName: "checkmark")
                        .foregroundColor(.accentColor)
                        .opacity(alarmViewModel.soundNum == soundViewModel.soundPackLength ? 1 : 0)
                        .frame(width: 30, height: 30)
                    Text("없음")
                }
            } //: NONE
            .tint(.primary)
            
        } //: LIST
        .fullScreenCover(isPresented: $songSelect, content: {
            SongAlarmView()
        })
        .listStyle(.insetGrouped)
        .modifier(BackButtonModifier(title: "사운드", soundStop: true))
    }
}

