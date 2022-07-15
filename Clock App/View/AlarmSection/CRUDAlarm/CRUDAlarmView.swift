//
//  CRUDAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/10.
//

import SwiftUI

struct RepeatDays {
    let day: String
    var isRepeat: Bool
}

struct CRUDAlarmView: View {
    
    // MARK: - PROPERTIES
    
    //: CORE DATA
    @Environment(\.managedObjectContext) var managedObjectContext
    
    //: CORE DATA ALARM, PROPERTIES
    @Binding var crudAlarm: Bool
    @State private var time: Date = Date()
    @State private var repeatDay: [RepeatDays] = (0..<7).map { i in
        RepeatDays(day: AlarmPeriodEnum.allCases[i].rawValue, isRepeat: false)
    }
    @State private var label: String = "알람"
    @State private var sound: String = "전파탐지기"
    @State private var notice: Bool = false
    
    //: COMPUTED PROPERTIES
    var repeatDays: String {
        let fileteredDay = repeatDay.filter { $0.isRepeat }
        switch fileteredDay.count {
        case 0:
            return "안함"
        case 1:
            return parsingOneDay(fileteredDay)
        case 7:
            return "매일"
        default:
            return parsingDays(fileteredDay)
        }
    }
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
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
                        Toggle(isOn: $notice) {
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
    
    // CORE DATA ACTIONs
    private func cancelAction() {crudAlarm = false}
    private func saveAction() {
        let alarm = Alarm(context: managedObjectContext)
        alarm.time = time
        alarm.repeatDay = repeatDays
        alarm.label = label
        alarm.sound = "전파탐지기"
        alarm.notice = notice
        
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
        
        crudAlarm = false
    }
    
    // PARSING REPEAT LABELS
    private func parsingOneDay(_ fileteredDay: [RepeatDays]) -> String {
        return fileteredDay[0].day
    }
    private func parsingDays(_ fileteredDay: [RepeatDays]) -> String {
        var days: String = ""
        for chosenDay in fileteredDay {
                days += "\(chosenDay.day.first!) "
        }
        return days
    }
}


// MARK: - PREVIEW

struct CRUDAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        CRUDAlarmView(crudAlarm: .constant(false))
    }
}
