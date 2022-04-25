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

    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(0..<soundControl.soundPack.count, id: \.self) { index in
                    if index == soundControl.soundPack.count - 1 {
//                        Button {
//
//                            withAnimation(.linear(duration: 0.2)) {
//                                currentSoundIndex = index
//                            }
//
//                        } label: {
//                            NavigationLink {
//                                Text("Classic Sounds!")
//                            } label: {
//                                HStack {
//                                    if currentSoundIndex == index {
//                                        Image(systemName: "checkmark")
//                                            .frame(width: 16, height: 16)
//                                    } else {
//                                        Color.clear.frame(width: 16, height: 16)
//                                    }
//
//                                    Text(soundControl.soundPack[index].name)
//                                        .font(.body)
//                                        .foregroundColor(.white)
//                                }
//                            }
//                        }
                        NavigationLink {
                            Text("Classic Sounds")
                                .onDisappear {
                                    
                                        currentSoundIndex = index
                                    
                                }
                        } label: {
                                HStack {
                                    if currentSoundIndex == index {
                                        Image(systemName: "checkmark")
                                            .frame(width: 16, height: 16)
                                            .foregroundColor(Color.accentColor))
                                    } else {
                                        Color.clear.frame(width: 16, height: 16)
                                    }
                                    
                                    Text(soundControl.soundPack[index].name)
                                        .font(.body)
                                        .foregroundColor(.white)
                                }
                            }

                    } else {
                        Button {
                            
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
            } //: LIST
            .onAppear(perform: {
                
                prevSoundIndex = currentSoundIndex
                
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
                            
                            currentSoundIndex = prevSoundIndex
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
