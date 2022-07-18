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
    @State private var prevSoundIndex: Int = 0
    @State private var tmpIndex: Int = 0
    @State private var isNavWent: Bool = false

    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                
                // MARK: - SOUND SECTION

                Section {
                    ForEach(0..<soundControl.soundPack.count, id: \.self) { index in
                        
                        /// Classic 버튼
                        if index == soundControl.soundPack.count - 1 {
                            NavigationLink {
                                // Classic Detail
            
                                ClassicSoundFooterView()
                                    .onAppear {
                                        withAnimation(.linear(duration: 0.2)) {
                                            // 취소버튼 활성화시, 오류 해결을 위한 코드
                                            currentSoundIndex = index
                                            tmpIndex = prevSoundIndex
                                            isNavWent.toggle()
                                            
                                            // sound paly - off
                                            stop()
                                            soundControl.isClick = false
                                        }
                                    }
                                
                                
                            } label: {
                                HStack {
                                    if currentSoundIndex == index {
                                        Image(systemName: "checkmark")
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color.accentColor)
                                    } else {
                                        Color.clear.frame(width: 16, height: 16)
                                    }
                                    
                                    Text(soundControl.soundPack[index].name)
                                        .font(.body)
                                        .foregroundColor(.white)
                                }
                            }

                        }
                        
                        /// Sounds 버튼
                        else {
                            Button {
                                
                                // sound play - on
                                if !soundControl.isClick || currentSoundIndex != index {
                                    play(file: soundControl.soundPack[index].soundPath)
                                    soundControl.isClick = true
                                } else {
                                    stop()
                                    soundControl.isClick = false
                                }
                                
                                withAnimation(.linear(duration: 0.2)) {
                                    currentSoundIndex = index
                                }
                                
                            } label: {
                                HStack {
                                    if currentSoundIndex == index {
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
                        } //: SELECTOR
                    } //: LOOP
                } //: SECTION 1
                
                // MARK: - NO SOUND SECTION

                Section {
                    Button {
                        
                        // sound play - off
                        stop()
                        soundControl.isClick = false
                        
                        withAnimation(.linear(duration: 0.2)) {
                            currentSoundIndex = -1
                        }
                        
                    } label: {
                        HStack {
                            if currentSoundIndex == -1 {
                                Image(systemName: "checkmark")
                                    .frame(width: 16, height: 16)
                            } else {
                                Color.clear.frame(width: 16, height: 16)
                            }
                            
                            Text("Stop Playing")
                                .font(.body)
                                .foregroundColor(.white)
                        }
                    } //: SELECTOR
                } //: SECTION 2
            } //: LIST
            .onAppear(perform: {
                prevSoundIndex = currentSoundIndex
            })
            .onDisappear(perform: {
                // sound play - off
                stop()
                soundControl.isClick = false
            })
            .interactiveDismissDisabled()
            .navigationTitle("When Timer Ends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                /// Cancel Button: 취소 버튼
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                        self.presentationMode.wrappedValue.dismiss()
                        withAnimation(.linear(duration: 0.2)) {
                            
                            if isNavWent {
                                currentSoundIndex = tmpIndex
                            } else {
                                currentSoundIndex = prevSoundIndex
                            }
                        }

                        
                    } label: {
                        Text("Cancel")
                    }
                } //: CANCEL
                
                /// Set Button: 선택 버튼
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Text("Set")
                    }
                    
                } //: SET
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
