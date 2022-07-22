//
//  CRUDAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/10.
//

import SwiftUI

struct CRUDAlarmView: View {
    
    // MARK: - PROPERTIES
    // SOUND DATA
    @EnvironmentObject var soundViewModel: SoundViewModel
    @EnvironmentObject var alarmViewModel: AlarmViewModel
    
    //: CORE DATA
    @Environment(\.managedObjectContext) var managedObjectContext
    
    //: dismiss
    @Environment(\.dismiss) var dismiss
    
    //: CORE DATA ALARM, PROPERTIES
    
    @State private var time: Date = Date()
    @State private var repeatDay: [Bool] = .init(repeating: false, count: 7)
    @State private var label: String = "알람"
    @State private var notice: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                //: 데이트 피커
                DatePicker(
                    "Alarm",
                    selection: $time,
                    displayedComponents: [.hourAndMinute]
                ) //: DATEPICKER
                .datePickerStyle(.wheel)
                .labelsHidden()
                .environment(\.locale, Locale.init(identifier: "KO_kr"))
                .padding(.top, 10)
                .padding(.bottom, -40)
                
                List {
                    //: 1. 반복 여부
                    NavigationLink(destination: RepeatAlarmView(repeatDay: $repeatDay)) {
                        HStack {
                            Text("반복")
                            Spacer()
                            Text(repeatDays).foregroundColor(.secondary)
                        }
                    }
                    
                    //: 2. 레이블
                    NavigationLink(destination: LabelAlarmView(label: $label)) {
                        HStack {
                            Text("레이블")
                            Spacer()
                            Text(label).foregroundColor(.secondary)
                        }
                    }
                    
                    //: 3. 사운드
                    NavigationLink(destination: SoundAlarmView())
                    {
                        HStack {
                            Text("사운드")
                            Spacer()
                            Text(sound).foregroundColor(.secondary)
                        }
                    }
                    
                    //: 4. 다시 알림
                    HStack {
                        Text("다시 알림")
                        Spacer()
                        Toggle(isOn: $notice) {
                            Text("다시 알림").opacity(0)
                        }                    }
                    
                    //: 5. 삭제버튼 (편집 모드)
                    if alarmViewModel.crudState == .edit {
                        Section {
                            Button(role: ButtonRole.destructive, action: deleteAction) {
                                Text("알람 삭제")
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        
                        
                    }
                } //: LIST
            } //: VSTACK
            .navigationTitle(
                alarmViewModel.crudState == .create ?
                "알람 추가" : "알람 편집"
            )
            .navigationBarTitleDisplayMode(.inline)
            //: TOOLBAR
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button(action: cancelAction) {Text("취소")}
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: alarmViewModel.crudState == .create ? createAction : updateAction) {Text("저장")}
                }
            }
        } //: NAVIGATATION
        .onAppear(perform: readAction)
        .onDisappear { alarmViewModel.editableAlarm = nil }
    }
    
    // MARK: - FUNCTIONS
    
    private func cancelAction() {
        dismiss()
    }
}

// MARK: - EXTENSION: CORE DATA CRUD ACTIONS
extension CRUDAlarmView {
    /// CREATE ACTION
    ///
    /// 새로운 알람 생성시, 동작하는 함수
    private func createAction() {
        let alarm = Alarm(context: managedObjectContext)
        alarm.time = time
        alarm.repeatDay = repeatDay
        alarm.label = label
        alarm.sound = sound
        alarm.notice = notice
        
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
        
        cancelAction()
    }
    
    /// READ ACTION
    ///
    /// 저장된 알람데이터 불러오기, 작동하는 함수
    private func readAction() {
        if let editableAlarm = alarmViewModel.editableAlarm {
            self.time = editableAlarm.time ?? .now
            self.repeatDay = editableAlarm.repeatDay ?? .init(repeating: false, count: 7)
            self.label = editableAlarm.label ?? "알람"
            self.notice = editableAlarm.notice
        }
    }
    
    /// UPDATE ACTION
    ///
    /// 기존 알람 데이터 편집시, 작동하는 함수
    private func updateAction() {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            deleteAction()
            createAction()
        }
    }
    
    /// DELETE ACTION
    ///
    /// 기존 알람 데이터 삭제시, 작동하는 함수
    private func deleteAction() {
        if let editableAlarm = alarmViewModel.editableAlarm {
            managedObjectContext.delete(editableAlarm)
        
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        } else { print("alarm is nil") }
        
        cancelAction()
    }
}


// MARK: - EXTENSION: HELPERS
extension CRUDAlarmView {
    /// repeatDay: [Bool] 데이터를 날짜 데이터로 파싱한 변수
    var repeatDays: String {
        let dayCount: Int = repeatDay.filter { $0 }.count
        
        switch dayCount {
        case 0:
            return "안함"
        case 1:
            return parsingOneDay()
        case 7:
            return "매일"
        default:
            return parsingDays()
        }
    }
    
    /// alarmViewModel.soundNum: Int 값을 파싱한 노래이름제목을 저장한 변수
    var sound: String {
        switch alarmViewModel.soundNum {
        case -1:
            return "곡"
        case soundViewModel.soundPackLength:
            return "없음"
        case soundViewModel.soundPackLength-1:
            if alarmViewModel.classicNum == -1 { return "" }
            else { return soundViewModel.getClassicName(index: alarmViewModel.classicNum)}
        default:
            return soundViewModel.getSoundName(index: alarmViewModel.soundNum)
        }
    }
    
    /// "~요일마다" 파싱 함수
    ///
    /// repeatDays 변수에 사용되는 함수(1)
    /// - Returns: String
    private func parsingOneDay() -> String {
        var newDay: String = ""
        for (day, selected) in zip(AlarmPeriodEnum.allCases, repeatDay) {
            if selected { newDay = day.rawValue }
        }
        return newDay
    }
    /// 각 요일을 합친 문자열을 반환하는 함수
    ///
    /// repeatDays 변수에 사용되는 함수(2)
    /// - Returns: ex) "월 화 목", "월 화 수 목 토"
    private func parsingDays() -> String {
        var days: String = ""
        for (day, selected) in zip(AlarmPeriodEnum.allCases, repeatDay) {
            if selected {
                days += "\(day.rawValue.first!) "
            }
        }
        return days
    }
}
