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
    
    
    
    // MARK: - BODY
    
    var body: some View {
        List {
            // MARK: - 진동 선택
            Section {
                NavigationLink {
                    Text("Vibration")
                } label: {
                    HStack {
                        Text("진동")
                        Spacer()
                        Text("동기화됨")
                            .foregroundColor(.secondary)
                    }
                }
            } //: VIBRATION SECTION
            
            // MARK: - 노래 선택
            Section {
                NavigationLink {
                    Text("To be continue..")
                } label: {
                    HStack {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                            .frame(width: 30, height: 30)
                            .opacity(0)
                        Text("노래 선택")
                        
                    }
                    .tint(.primary)
                    .onTapGesture {
                        alarmSoundModel.soundNum = -1
                    }
                    
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

