//
//  FooterView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

struct FooterView: View {
    
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
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
        } //: GROUP
        .cornerRadius(myCornerRadius)
    }
}

// MARK: - PREVIEW

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
