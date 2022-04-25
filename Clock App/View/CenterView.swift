//
//  CenterView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

struct CenterView: View {
    var body: some View {
        HStack {
            Button {
                //
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
                //
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
    }
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
