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

            Rectangle()
                .fill(.red)
                .padding(.horizontal ,horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(minHeight: headerFrame.min.height, maxHeight: headerFrame.min.height)
            
            // MARK: - CENTER

            Rectangle()
                .fill(.green)
                .padding(.horizontal ,horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(minHeight: centerFrame.min.height, maxHeight: centerFrame.min.height)
            
            // MARK: - FOOTER

            Rectangle()
                .fill(.blue)
                .padding(.horizontal ,horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(minHeight: footerFrame.min.height, maxHeight: footerFrame.min.height)
            
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
