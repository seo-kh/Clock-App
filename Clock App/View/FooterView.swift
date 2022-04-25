//
//  FooterView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

struct FooterView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var soundControl: SoundControl
    @State private var isPresented: Bool = false
    
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
                        
                        Text("Radar")
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
                        .environmentObject(soundControl)
                        .environment(\.managedObjectContext, managedObjectContext)
            }
        }
        
    }
}

// MARK: - PREVIEW

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(SoundControl())
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
