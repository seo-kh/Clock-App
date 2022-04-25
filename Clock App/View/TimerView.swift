//
//  TimerView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/22.
//

import SwiftUI

struct TimerView: View {
    // MARK: - PORPERTIES
    
    
    
    // MARK: - BODY

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // MARK: - HEADER

            HeaderView()
                .padding(.horizontal ,horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(minHeight: headerFrame.min.height, maxHeight: headerFrame.max.height)
                .overlay(
                    
                    // MARK: - CENTER

                    CenterView()
                        .padding(.horizontal ,horizontalPadding)
                        .padding(.vertical, verticalPadding)
                        .frame(minHeight: centerFrame.min.height, maxHeight: centerFrame.max.height)
                        .offset(y: screenHeight * 0.1)
                        .padding(.top, -screenHeight * 0.1)
                    , alignment: .bottom
                )
            
           
            
            // MARK: - FOOTER

            FooterView()
                .padding(.horizontal ,horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(minHeight: footerFrame.min.height, maxHeight: footerFrame.max.height)
            
            Spacer()
        } //: VSTACK
    }
}

// MARK: - PREVIEW


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
