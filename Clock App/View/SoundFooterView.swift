//
//  SoundFooterView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

struct SoundFooterView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("currentSoundIndex") var currentSoundIndex: Int = 0
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var soundControl: SoundControl
    
    var currentIndex: Int? {
        return soundControl.soundPack.firstIndex { $0.isSelected }
    }
    
    var filteredSounds: [SoundData]  = [SoundData]()
    
    // MARK: - FUNCTIONS
    
    private func save() {
        // 1. cancel, set, dismiss 시 데이터 저장.
    }

    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(0..<soundControl.soundPack.count, id: \.self) { index in
                    Button {
                        withAnimation(.linear(duration: 0.2)) {
                            
                            /// Prev Sound
                            guard let currentIndex = currentIndex else {return}
                            soundControl.prevIndex = currentIndex
                            soundControl.soundPack[currentIndex].isSelected.toggle()
                            
                            
                            /// New Sound
                            soundControl.currentIndex = index
                            soundControl.soundPack[index].isSelected.toggle()
                        }
                        
                    } label: {
                        HStack {
                            if soundControl.soundPack[index].isSelected {
                                Image(systemName: "checkmark")
                                    .frame(width: 16, height: 16)
                            } else {
                                Color.clear.frame(width: 16, height: 16)
                            }
                            
                            Text(soundControl.soundPack[index].name)
                                .font(.body)
                                .foregroundColor(.white)
                        }
                    }
                }
            } // LIST
            .onAppear(perform: {
                if let currentIndex = currentIndex {
                    soundControl.prevIndex = currentIndex
                    currentSoundIndex = currentIndex
                }
                print("Appear 될때 current Index값 : \(currentSoundIndex)")
                
            })
            .interactiveDismissDisabled()
            .navigationTitle("When Timer Ends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                /// Cancel Button: 취소 버튼
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                        self.presentationMode.wrappedValue.dismiss()
                        currentSoundIndex = soundControl.prevIndex
                        soundControl.soundPack[soundControl.prevIndex].isSelected.toggle()
                        soundControl.soundPack[soundControl.currentIndex].isSelected.toggle()
                        print("취소 될때 current Index값 : \(currentSoundIndex)")
                        
                    } label: {
                        Text("Cancel")
                    }
                }
                
                /// Set Button: 선택 버튼
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                        self.presentationMode.wrappedValue.dismiss()
                        currentSoundIndex = soundControl.currentIndex
                        print("세팅 될때 current Index값 : \(currentSoundIndex)")
                    } label: {
                        Text("Set")
                    }
                    
                }
            } //: TOOLBAR
        } // NAVIGATION
                      
    }
}


// MARK: - PREVIEW

struct SoundFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SoundFooterView()
            .environmentObject(SoundControl())
    }
}
