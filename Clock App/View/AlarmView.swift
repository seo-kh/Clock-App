//
//  AlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/08.
//

import SwiftUI

struct AlarmView: View {
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    @State private var isSetting: Bool = false
    
    
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
                        Text("Hello")
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
                    Button {
                        //
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        } //: NAVIGATION
        //: ALARM SETTING
        .sheet(isPresented: $isSetting) {
            AlarmSettingView(isSetting: $isSetting)
        }
        
    }
    
    // MARK: - FUNCTIONS
    
    private func settingButton() { isSetting = true }
    
}

// MARK: - PREVIEW

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
