//
//  CRUDAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/10.
//

import SwiftUI

struct CRUDAlarmView: View {
    
    // MARK: - PROPERTIES
    
    @Binding var crudAlarm: Bool
    @State private var date: Date = Date()
    @State private var noticeAgain: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                    "Alarm",
                    selection: $date,
                    displayedComponents: [.hourAndMinute]
                ) //: DATEPICKER
                .datePickerStyle(.wheel)
                .labelsHidden()
                .environment(\.locale, Locale.init(identifier: "KO_kr"))
                .padding(.top, 10)
                .padding(.bottom, -40)
                
                List {
                    //: 1. 반복 여부
                    NavigationLink(destination: RepeatAlarmView()) {
                        HStack {
                            Text("반복")
                            Spacer()
                            Text("안함").foregroundColor(.secondary)
                        }
                    }
                    
                    //: 2. 레이블
                    NavigationLink(destination: LabelAlarmView()) {
                        HStack {
                            Text("레이블")
                            Spacer()
                            Text("알람").foregroundColor(.secondary)
                        }
                    }
                    
                    //: 3. 사운드
                    NavigationLink(destination: Text("전파 탐지기")) {
                        HStack {
                            Text("사운드")
                            Spacer()
                            Text("전파 탐지기").foregroundColor(.secondary)
                        }
                    }
                    
                    //: 4. 다시 알림
                    HStack {
                        Text("다시 알림")
                        Spacer()
                        Toggle(isOn: $noticeAgain) {
                            Text("다시 알림").opacity(0)
                        }.toggleStyle(DefaultToggleStyle())
                    }
                } //: LIST
            } //: VSTACK
            .navigationTitle("알람 추가")
            .navigationBarTitleDisplayMode(.inline)
            //: TOOLBAR
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button(action: cancelAction) {Text("취소")}
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: saveAction) {Text("저장")}
                }
            }
        } //: NAVIGATATION
    }
    
    // MARK: - FUNCTIONS
    
    private func cancelAction() {crudAlarm = false}
    private func saveAction() {}
}


// MARK: - PREVIEW

struct CRUDAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        CRUDAlarmView(crudAlarm: .constant(false))
    }
}
