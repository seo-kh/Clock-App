//
//  TimerDisplayView.swift
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

struct TimerDisplayView: View {
    
    // MARK: - PROPERTIES
    @EnvironmentObject var timerControl: TimerControl
    
    // INITIAL PROPERTY
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
    
    @State private var endAngle: Double = -90.0
    
    private var remainingTime: RemainigTime {
        let remainingTime: Double = seconds - secondsElapsed
        let newDate: Date = Date.init(timeIntervalSinceReferenceDate: remainingTime)
        let remainingTitle: String = countdownDateFormatter.string(from: newDate)
        return RemainigTime(value: remainingTime, title: remainingTitle)
    }
    
    private var deltaAngle: Double {
        return 360.0 / self.seconds
    }
    
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
        endAngle = computedDegree
    }
    
    private func setNotification() {
        let manager = LocalNotificationManager()
        manager.addNotification(title: "Clock", subTitle: "Timer")
        manager.schedule()
    }
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            
            // Background Ring.
            BackgroundRingView()
                .stroke(Color("GrayColor"), lineWidth: 6.0)
            
            // Main Ring.
            TimerRing(endAngle: endAngle)
                .stroke(
                    Color.accentColor,
                    style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: .round)
                )
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
                        withAnimation(.linear(duration: 1)) {
                            calcDegree()
                        }
                    } else {
                        self.cancelTimer()
                        timerControl.isStart = false
                        timerControl.timerStatus = .pause
                        self.setNotification()
                    }
                }
                .onChange(of: timerControl.timerStatus) { status in
                    if timerControl.isStart {
                        switch status {
                        case .pause:
                            self.cancelTimer()
                        case.resume:
                            self.instantiateTimer()
                        case .start:
                            self.instantiateTimer()
                        }
                    }
                }
        } //: ZSTACK
    }
}

// MARK: - PREVIEW

struct TimeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimerDisplayView(seconds: 20)
                .previewLayout(.sizeThatFits)
                .padding()
                .environmentObject(TimerControl())
        }
    }
}
