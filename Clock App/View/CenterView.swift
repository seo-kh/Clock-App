//
//  CenterView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

struct CenterView: View {
    @EnvironmentObject var timerControl: TimerControl
    
    var body: some View {
        HStack {
            Button {
                timerControl.isStart = false
                timerControl.timerStatus = .pause
            } label: {
                Circle()
                    .fill(Color("GrayColor"))
                    .frame(width: buttonSize, height: buttonSize, alignment: .center)
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                            .frame(width: buttonSize * 0.9, height: buttonSize * 0.9, alignment: .center)
                    )
                    .overlay(
                        Text("Cancel")
                            .fontWeight(.medium)
                            .foregroundColor(
                                timerControl.isStart ?
                                Color.white :
                                Color("GrayTextColor")
                            )
                    )
            }
            
            Spacer()
            
            if !timerControl.isStart && timerControl.timerStatus == .pause {
                Button {
                    timerControl.isStart = true
                    timerControl.timerStatus = .start
                } label: {
                    Circle()
                        .fill(Color("GreenColor"))
                        .frame(width: buttonSize, height: buttonSize, alignment: .center)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .frame(width: buttonSize * 0.9, height: buttonSize * 0.9, alignment: .center)
                        )
                        .overlay(
                            Text("Start")
                                .fontWeight(.medium)
                                .foregroundColor(Color("GreenTextColor"))
                        )
                }
            } else if timerControl.isStart && timerControl.timerStatus == .start {
                Button {
                    timerControl.timerStatus = .pause
                } label: {
                    Circle()
                        .fill(Color("YellowColor"))
                        .frame(width: buttonSize, height: buttonSize, alignment: .center)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .frame(width: buttonSize * 0.9, height: buttonSize * 0.9, alignment: .center)
                        )
                        .overlay(
                            Text("Pause")
                                .fontWeight(.medium)
                                .foregroundColor(Color("YellowTextColor"))
                        )
                }
            } else if timerControl.isStart && timerControl.timerStatus == .pause {
                Button {
                    timerControl.timerStatus = .resume
                } label: {
                    Circle()
                        .fill(Color("GreenColor"))
                        .frame(width: buttonSize, height: buttonSize, alignment: .center)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .frame(width: buttonSize * 0.9, height: buttonSize * 0.9, alignment: .center)
                        )
                        .overlay(
                            Text("Resume")
                                .fontWeight(.medium)
                                .foregroundColor(Color("GreenTextColor"))
                        )
                }
            } else if timerControl.isStart && timerControl.timerStatus == .resume {
                Button {
                    timerControl.timerStatus = .pause
                } label: {
                    Circle()
                        .fill(Color("YellowColor"))
                        .frame(width: buttonSize, height: buttonSize, alignment: .center)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .frame(width: buttonSize * 0.9, height: buttonSize * 0.9, alignment: .center)
                        )
                        .overlay(
                            Text("Pause")
                                .fontWeight(.medium)
                                .foregroundColor(Color("YellowTextColor"))
                        )
                }
            }
            

        } //: HSTACK
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(TimerControl())
    }
}
