//
//  SoundFooterView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/25.
//

import SwiftUI

struct SoundFooterView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("currentSoundIndex") var currentSoundIndex: Int?
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var soundControl: SoundControl
    
//    @FetchRequest(entity: Clock.entity(), sortDescriptors: [NSSortDescriptor(key: \, ascending: <#T##Bool#>)])
    
    var prevIndex: Int? {
        return soundControl.soundPack.firstIndex { $0.isSelected }
    }
    
    // MARK: - FUNCTIONS
    
    private func save() {
        currentSoundIndex = prevIndex
    }

    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(0..<soundControl.soundPack.count, id: \.self) { index in
                    Button {
                        withAnimation(.linear(duration: 0.2)) {
                            
                            /// Prev Sound
                            guard let prevIndex = prevIndex else {return}
                            soundControl.prevIndex = prevIndex
                            soundControl.soundPack[prevIndex].isSelected.toggle()
                            
                            
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
                //
            })
            .onDisappear {
                //
            }
            .navigationTitle("When Timer Ends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                /// Cancel Button: 취소 버튼
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                        //
                        
                    } label: {
                        Text("Cancel")
                    }
                }
                
                /// Set Button: 선택 버튼
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
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
