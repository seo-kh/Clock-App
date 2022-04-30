//
//  BackgroundRingView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/30.
//

import SwiftUI

struct BackgroundRingView: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2.0,
            startAngle: Angle.degrees(-90.0),
            endAngle: Angle.degrees(-90.01),
            clockwise: false
        )
        
        return p
    }
}
