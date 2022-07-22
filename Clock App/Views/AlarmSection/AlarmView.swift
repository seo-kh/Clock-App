//
//  AlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/08.
//

import SwiftUI

struct AlarmView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var managedOjbectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.time)]) var alarms: FetchedResults<Alarm>
    @EnvironmentObject var alarmViewModel: AlarmViewModel

    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - INFO SECTION
                info
                
                
                // MARK: - SETTING SECTION
                setting
                
                // MARK: - ALARM SECTION
                alarmMain
                
            } //: LIST
            .navigationTitle("알람")
            .listStyle(.inset)
            // MARK: - TOOLBAR
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: alarmViewModel.createButton) { Image(systemName: "plus") }
                }
            }
        } //: NAVIGATION
        // MARK: SHEET
        //: ALARM SETTING
        .sheet(isPresented: $alarmViewModel.isSetting) { AlarmSettingView() }
        .sheet(item: $alarmViewModel.crudState) { _ in CRUDAlarmView() }
    }
    
    // MARK: - View Components
    var info: some View {
        HStack {
            Image(systemName: "bed.double.fill")
            Text("수면 | 기상").fontWeight(.bold)
        } //: HSTACK
        .font(.title3)
    }
    
    var setting: some View {
        HStack {
            Text("알람 없음")
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
            Spacer()
            Button(action: alarmViewModel.settingButton) {
                Text("설정")
                    .fontWeight(.semibold)
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
        } //: HSTACK
        .frame(maxWidth: .infinity)
    }
    
    var alarmMain: some View {
        Group {
            Section {
                // ALARMCELL
                ForEach(alarms) { (alarm: Alarm) in
                    AlarmCellView(alarm:alarm)
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
    }
    // MARK: - FUNCTIONS
    
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
