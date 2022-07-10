//
//  ClassicSoundFooterView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/30.
//

import SwiftUI

struct ClassicSoundFooterView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var soundControl: SoundControl
    @AppStorage("classicSoundIndex") var classicSoundIndex: Int = 0
    
    // MARK: - BODY

    var body: some View {
        List {
            ForEach(0..<soundControl.classicSoundPack.count, id: \.self) {
                index in
                Button {
                    if !soundControl.isClick || classicSoundIndex != index {
                        play(file: soundControl.classicSoundPack[index].soundPath)
                        soundControl.isClick = true
                    } else {
                        stop()
                        soundControl.isClick = false
                    }
                    
                    withAnimation(.linear(duration: 0.2)) {
                        classicSoundIndex = index
                    }
                    
                } label: {
                    HStack {
                        if classicSoundIndex == index {
                            Image(systemName: "checkmark")
                                .frame(width: 16, height: 16)
                        } else {
                            Color.clear.frame(width: 16, height: 16)
                        }
                        
                        Text(soundControl.classicSoundPack[index].name)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                }

            }
        }
        .navigationTitle("클래식")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            // sound play stop
            stop()
            soundControl.isClick = false
        }
    }
}

// MARK: - PREVIEW

struct ClassicSoundFooterView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicSoundFooterView()
            .environmentObject(SoundControl())
    }
}
