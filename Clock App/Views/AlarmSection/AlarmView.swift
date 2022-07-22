//
//  AlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/08.
//

import SwiftUI

enum CRUDState: Int, Identifiable {
    case create
    case edit
    var id: Int {
        self.rawValue
    }
}

struct AlarmView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var managedOjbectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.time)]) var alarms: FetchedResults<Alarm>
    @State private var isSetting: Bool = false
    @State private var crudState: CRUDState? = nil
    @State private var editableAlarm: Alarm? = nil
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - INFO SECTION
                HStack {
                    Image(systemName: "bed.double.fill")
                    Text("수면 | 기상").fontWeight(.bold)
                } //: HSTACK
                .font(.title3)
                
                // MARK: - SETTING SECTION
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
                
                // MARK: - ALARM SECTION
                Group {
                    Section {
                        // ALARMCELL
                        ForEach(alarms) { (alarm: Alarm) in
                            AlarmCellView(
                                alarm:alarm,
                                crudState: $crudState,
                                editableAlarm: $editableAlarm
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
            // MARK: - TOOLBAR
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: createButton) { Image(systemName: "plus") }
                }
            }
        } //: NAVIGATION
        // MARK: SHEET
        //: ALARM SETTING
        .sheet(isPresented: $isSetting) { AlarmSettingView(isSetting: $isSetting) }
        .sheet(item: $crudState) { crudState in
            CRUDAlarmView(crudState: $crudState, editableAlarm: $editableAlarm)
        }
        
    }
    
    // MARK: - FUNCTIONS
    
    private func settingButton() { isSetting = true }
    private func createButton() { crudState = .create }
    private func delete(at offset: IndexSet) {
        for index in offset {
            let alarm = alarms[index]
            managedOjbectContext.delete(alarm)
        }
        
        do {
            try managedOjbectContext.save()
        } catch {
            print(error)
        }
    }
    
}

// MARK: - PREVIEW

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        let persistantController = PersistenceController.shared
        AlarmView()
            .environment(\.managedObjectContext, persistantController.container.viewContext)
    }
}
