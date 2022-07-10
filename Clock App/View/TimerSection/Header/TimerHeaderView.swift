//
//  TimerHeaderView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

struct TimerHeaderView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var timerControl: TimerControl
    @EnvironmentObject var soundControl: SoundControl
    
    
    // MARK: - BODY

    var body: some View {
            if !timerControl.isStart {
                
                /// Time Selection
                TimerPickerView(duration: $timerControl.timeInterval)
            } else {
                
                /// Time Display
                TimerDisplayView(seconds: timerControl.timeInterval)
                    .environmentObject(soundControl)
            }
    }
}

// MARK: - PREVIEW

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TimerHeaderView()
            .environmentObject(TimerControl())
            .environmentObject(SoundControl())
    }
}
