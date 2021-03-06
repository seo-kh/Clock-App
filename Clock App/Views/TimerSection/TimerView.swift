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

            TimerHeaderView()
                .padding(.horizontal ,horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(maxWidth: .infinity ,minHeight: headerFrame.min.height, maxHeight: headerFrame.max.height)
            // MARK: - CENTER
            
            TImerCenterView()
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(maxWidth: .infinity, minHeight: centerFrame.min.height, maxHeight: centerFrame.min.height)
            
            // MARK: - FOOTER

            TimerFooterView()
                .padding(.horizontal ,horizontalPadding)
                .padding(.vertical, verticalPadding)
                .frame(maxWidth: .infinity, minHeight: footerFrame.min.height, maxHeight: footerFrame.max.height)
            
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
