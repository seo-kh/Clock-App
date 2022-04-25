//
//  TimeHeaderView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI
import Combine

private struct RemainigTime {
    var value: Double
    var title: String
}

struct TimerRing: Shape {
    var endAngle: Angle
    
    var animatableData: Angle {
        get { endAngle }
        set { endAngle = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.addArc(
            center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0),
            radius: rect.width / 2.0,
            startAngle: Angle(degrees: -90),
            endAngle: endAngle,
            clockwise: false
        )
        
        return p
    }
}

struct TimeHeaderView: View {
    
    // MARK: - PROPERTIES
    let seconds: Double
    
    init(seconds: Double) {
        self.seconds = seconds
    }
    
    // TIMER PROPERTIES

    @State private var secondsElapsed = 0.0
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    @State private var connectedTimer: Cancellable? = nil

    // CUSTOM PROPERTIES
    
    @State private var isTimerOn: Bool = false
    @State private var currentTime: String = {
        let currentDate = Date.now
        let currentTime = currentDateFormatter.string(from: currentDate)
        return currentTime
    } ()
    @State private var endAngle: Angle = .degrees(-90)
    
    private var remainingTime: RemainigTime {
        let remainingTime: Double = seconds - secondsElapsed
        let newDate: Date = Date.init(timeIntervalSinceReferenceDate: remainingTime)
        let remainingTitle: String = countdownDateFormatter.string(from: newDate)
        return RemainigTime(value: remainingTime, title: remainingTitle)
    }
    
    private var deltaAngle: Double {
        return 360.0 / self.seconds
    }
    
//    private var deltaEndAngle: Angle {
//        let computedDegree: Double = -(90.0 + deltaAngle * secondsElapsed)
//        return Angle(degrees: computedDegree)
//    }
    
    // MARK: - FUNCTIONS

    private func instantiateTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common)
        self.connectedTimer = self.timer.connect()
        self.isTimerOn = true
        return
    }
    
    private func cancelTimer() {
        self.connectedTimer?.cancel()
        self.isTimerOn = false
        return
    }
    
    private func resetCounter() {
        self.secondsElapsed = 0
        return
    }
    
    private func restartTimer() {
        self.secondsElapsed = 0
        self.cancelTimer()
        self.instantiateTimer()
        return
    }
    
    private func calcDegree() {
        let computedDegree: Double = -(90.0 + deltaAngle * secondsElapsed)
        endAngle = Angle(degrees: computedDegree)
    }
    
    // MARK: - BODY

    var body: some View {
        TimerRing(endAngle: endAngle)
            .stroke(Color.accentColor, lineWidth: 6)
            .overlay(
                VStack(alignment: .center, spacing: 16, content: {
                    Text(remainingTime.title)
                        .font(.system(size: 80, weight: .thin, design: .default))
                    
                    Label(currentTime, systemImage: "bell.fill")
                        .font(.title3)
                        .foregroundColor(isTimerOn ? Color.white : Color.secondary)
                })
            )
        .onAppear {
            self.instantiateTimer()
            
        }.onDisappear {
            self.cancelTimer()
            
        }.onReceive(timer) { _ in
            if self.remainingTime.value > 0 {
                self.secondsElapsed += 1.0
                withAnimation {
                    calcDegree()
                }
            } else {
                self.cancelTimer()
            }
        }
        
        
    }
}

// MARK: - PREVIEW

struct TimeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimeHeaderView(seconds: 20)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
