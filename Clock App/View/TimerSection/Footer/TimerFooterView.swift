//
//  TimerFooterView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

struct TimerFooterView: View {
    
    // MARK: - PROPERTIES
    
    @AppStorage("currentSoundIndex") var currentSoundIndex: Int = 0
    @AppStorage("classicSoundIndex") var classicSoundIndex: Int = 0
    @EnvironmentObject var soundControl: SoundControl
    @State private var isPresented: Bool = false
    
    var soundTitle: String {
        if currentSoundIndex == -1 {
            return "Stop Playing"
        } else if currentSoundIndex == soundControl.soundPack.count - 1 {
            return soundControl.classicSoundPack[classicSoundIndex].name
        } else  {
            return soundControl.soundPack[currentSoundIndex].name
        }
    }
    
    // MARK: - BODY

    var body: some View {
        NavigationView {
            GroupBox {
                    HStack(alignment: .center, spacing: 6) {
                        Text("When Timer Ends")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(soundTitle)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                        Image(systemName: "chevron.right")
                            .font(.system(.title2, design: .rounded))
                            .foregroundColor(.secondary)
                    } //: HSTACK
                    .onTapGesture {
                        isPresented = true
                    }
                } //: GROUP
                .cornerRadius(myCornerRadius)
                .navigationBarHidden(true)
                .sheet(isPresented: $isPresented) {
                    SoundFooterView()
            }
        }
        
    }
}

// MARK: - PREVIEW

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        TimerFooterView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(SoundControl())
    }
}
