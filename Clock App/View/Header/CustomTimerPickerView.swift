//
//  CustomTimerPickerView.swift
//  Clock App
//
//  Created by 서광현 on 2022/05/12.
//

import SwiftUI

struct CustomTimerPickerView: View {
    // MARK: - PROPERTEIS
    
    
    // MARK: - BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(0..<60) { second in
                    Text("\(second)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .rotation3DEffect(Angle(degrees: 10.0), axis: (x: 1, y: 0, z: 0))
                        
                } //: LOOP
            } //: VSTACK
            .padding(.vertical, 200 - 20 + 4)
            
            
        } //: SCROLL
        .frame(maxWidth: 300, maxHeight: 400)
        
        //: TIME UNIT
        .overlay(
            Text("Seconds")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.trailing, 30)
            , alignment: .trailing
        )
        //: SEPERATOR
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.white.opacity(0.2))
                .frame(maxHeight: 50.0)
                .padding()
        )
        
    }
}

// MARK: - PREVIEW

struct CustomTimerPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimerPickerView()
            .previewLayout(.sizeThatFits)
    }
}
