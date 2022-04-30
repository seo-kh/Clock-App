//
//  PlayGroundView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/30.
//

import SwiftUI

//struct PlayGroundView: Shape {
//    var insetAmount: Double
//
//    var animatableData: Double {
//        get { insetAmount }
//        set { insetAmount = newValue}
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var p = Path()
//
//        p.move(to: CGPoint(x: 0, y: rect.maxY))
//        p.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
//        p.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
//        p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        p.addLine(to: CGPoint(x: 0, y: rect.maxY))
//
//        return p
//    }
//}
//
//struct ShapeContentView: View {
//    @State private var insetAmount: Double = 20.0
//
//    var body: some View {
//        PlayGroundView(insetAmount: insetAmount)
//            .frame(width: 200, height: 200)
//            .onTapGesture {
//                withAnimation {
//                    insetAmount = Double.random(in: 10.0...90.0)
//                }
//            }
//    }
//}

struct BackgroundRingView: Shape {
    var degree: Angle
    
    var animatableData: Angle {
        get { degree }
        set { degree = newValue }
    }
    
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

struct ShapeContentView: View {
    @State private var degree: Angle = Angle.degrees(-100.0)
    
    var body: some View {
        BackgroundRingView(degree: degree)
            .stroke(Color.accentColor, lineWidth: 6.0)
            .onTapGesture {
                withAnimation {
                    degree += Angle.degrees(-10.0)
                }
            }
            .padding()
    }
}

struct PlayGroundView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeContentView()
    }
}
