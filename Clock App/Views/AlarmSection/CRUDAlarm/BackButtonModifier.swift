//
//  BackButtonModifier.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/23.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    let title: String
    var soundStop: Bool = false
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button {
                        dismiss()
                        if soundStop { stop() }
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("뒤로")
                        }
                    }
                    
                }
            }
    }
}
