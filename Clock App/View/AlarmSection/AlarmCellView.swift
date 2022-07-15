//
//  AlarmCellView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/11.
//

import SwiftUI

struct AlarmCellView: View {
    // MARK: - PROPERTIES

    let ampm: String
    let time: String
    @State var noticeAgain: Bool
    let label: String
    
    // MARK: - BODY

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: 5) {
                // MARK: - AM | PM
                Text(ampm)
                    .font(.system(size: 25, weight: .light, design: .default))
                    .offset(y: 10)
                
                // MARK: - TIME
                Text(time)
                    .font(.system(size: 40, weight: .light, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: - NOTIFICATION AGAIN
                Toggle(isOn: $noticeAgain)
                {
                    //
                }.fixedSize(horizontal: false, vertical: true)
            } //: HSTACK
            
            // MARK: - LABEL
            Text(label).offset(y: -10).fixedSize()
        } //: VSTACK
        .foregroundColor(noticeAgain ? .primary : .secondary)
        
    }
}

struct AlarmCellView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmCellView(
            ampm: "오전",
            time: "4:00",
            noticeAgain: true,
            label: "알람"
        )
            .previewLayout(.sizeThatFits)
    }
}
