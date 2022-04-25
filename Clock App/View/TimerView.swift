//
//  TimerView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/22.
//

import SwiftUI

struct TimerView: View {
    // MARK: - PORPERTIES
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var timerControl: TimerControl
    @EnvironmentObject var soundControl: SoundControl
    
    
    // MARK: - BODY

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            // MARK: - HEADER

            HeaderView()
                .padding(.horizontal ,horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(maxWidth: .infinity ,minHeight: headerFrame.min.height, maxHeight: headerFrame.max.height)
                .environmentObject(timerControl)
            
            // MARK: - CENTER
            
            CenterView()
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(maxWidth: .infinity, minHeight: centerFrame.min.height, maxHeight: centerFrame.min.height)
                .environmentObject(timerControl)
            
            // MARK: - FOOTER

            FooterView()
                .padding(.horizontal ,horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(maxWidth: .infinity, minHeight: footerFrame.min.height, maxHeight: footerFrame.max.height)
                .environmentObject(soundControl)
                .environment(\.managedObjectContext, managedObjectContext)
            
            Spacer()
        } //: VSTACK
    }
}

// MARK: - PREVIEW


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimerControl())
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
