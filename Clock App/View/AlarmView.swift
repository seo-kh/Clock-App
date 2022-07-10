//
//  AlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/08.
//

import SwiftUI

struct Info: Identifiable {
    let id = UUID().uuidString
    let ampm: String
    let time: String
    let noticeAgain: Bool
    let label: String
}

struct AlarmView: View {
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    @State private var isSetting: Bool = false
    @State private var crudAlarm: Bool = false
    @State private var infos = [
        Info(ampm: "오전", time: "4:00", noticeAgain: true, label: "알람"),
        Info(ampm: "오전", time: "5:00", noticeAgain: true, label: "알람"),
        Info(ampm: "오전", time: "8:00", noticeAgain: true, label: "카페"),
        Info(ampm: "오후", time: "5:00", noticeAgain: false, label: "수면"),
        Info(ampm: "오후", time: "6:00", noticeAgain: false, label: "알람"),
    ]
        
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                // INFO SECTION
                HStack {
                    Image(systemName: "bed.double.fill")
                    Text("수면 | 기상").fontWeight(.bold)
                } //: HSTACK
                .font(.title3)
                
                // SETTING SECTION
                HStack {
                    Text("알람 없음")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                    Spacer()
                    Button(action: settingButton) {
                        Text("설정")
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                } //: HSTACK
                .frame(maxWidth: .infinity)
                
                // ALARM SECTION
                Group {
                    Section {
                        // ALARMCELL
                        ForEach(infos) { info in
                            AlarmCellView(
                                ampm: info.ampm,
                                time: info.time,
                                noticeAgain: info.noticeAgain,
                                label: info.label
                            )
                        } //: LOOP
                        .onDelete(perform: delete)
                    } header: {
                        Text("기타")
                            .foregroundColor(.primary)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .headerProminence(.increased)
                }
                
            } //: LIST
            .navigationTitle("알람")
            .listStyle(.inset)
            .listRowSeparatorTint(.primary)
            .listRowInsets(.init(top: 0, leading: 15.0, bottom: 0, trailing: 0))
            //: TOOLBAR
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: createButton) { Image(systemName: "plus") }
                }
            }
        } //: NAVIGATION
        //: ALARM SETTING
        .sheet(isPresented: $isSetting) { AlarmSettingView(isSetting: $isSetting) }
        //: CREATE ALARM
        .sheet(isPresented: $crudAlarm) { CRUDAlarmView(crudAlarm: $crudAlarm) }
        
    }
    
    // MARK: - FUNCTIONS
    
    private func settingButton() { isSetting = true }
    private func createButton() { crudAlarm = true }
    private func delete(at offset: IndexSet) {
        infos.remove(atOffsets: offset)
    }
    
}

// MARK: - PREVIEW

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
