//
//  HeaderView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var timerControl: TimerControl
    
    
    // MARK: - BODY

    var body: some View {
            if !timerControl.isStart {
                PickerHeaderView(duration: $timerControl.timeInterval)
            } else {
                TimeHeaderView(seconds: timerControl.timeInterval)
            }
    }
}

// MARK: - PREVIEW

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(TimerControl())
    }
}
