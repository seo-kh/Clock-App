//
//  TimerRIngView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

struct TimerRing: Shape {
    var endAngle: Double
    
    var animatableData: Double {
        get { endAngle }
        set { endAngle = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.addArc(
            center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0),
            radius: rect.width / 2.0,
            startAngle: Angle.degrees(-90.0),
            endAngle: Angle.degrees(endAngle),
            clockwise: false
        )
        
        return p
    }
}
