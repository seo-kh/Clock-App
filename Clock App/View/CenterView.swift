//
//  CenterView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

struct CenterView: View {
    @Binding var isStart: Bool
    
    var body: some View {
        HStack {
            Button {
                isStart = false
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
                            .foregroundColor(Color("GrayTextColor"))
                    )
            }
            
            Spacer()
            
            Button {
                isStart = true
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
            

        } //: HSTACK
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView(isStart: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
