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

    // MARK: - BODY

    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            } //: VSTACK
            .navigationTitle("알람 추가")
            .navigationBarTitleDisplayMode(.inline)
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
