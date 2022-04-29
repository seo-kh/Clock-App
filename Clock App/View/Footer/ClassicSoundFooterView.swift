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
    }
}

// MARK: - PREVIEW

struct ClassicSoundFooterView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicSoundFooterView()
            .environmentObject(SoundControl())
    }
}
