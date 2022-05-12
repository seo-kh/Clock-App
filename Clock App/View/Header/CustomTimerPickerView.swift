//
//  CustomTimerPickerView.swift
//  Clock App
//
//  Created by 서광현 on 2022/05/12.
//

import SwiftUI

struct CustomTimerPickerView: View {
    
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { value in
                VStack(spacing: 0) {
                    ForEach(0..<60) { second in
                        HStack {
                            GeometryReader { geo in
                                Text("\(second)")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                                    .frame(width: 200, height: 50)
                                    .id(second)
                                    .rotation3DEffect(.degrees(Double(geo.frame(in: .global).maxY) / 2.5 - 170), axis: (x: 1.0, y: 0.0, z: 0.0), anchorZ: -5)
                                    
                            } //: GEOMETRY
                            .frame(width: 200, height: 50)
                        } //: HSTACK
                    } //: LOOP
                } //: VSTACK
                .padding(.vertical, 175)
            }
        } //: SCROLL
        .frame(maxWidth: 300, maxHeight: 400)
        .overlay(
            Text("S")
                .font(.title2)
                .fontWeight(.bold)
                .offset(x: 30)
            , alignment: .center
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.white.opacity(0.2))
                .frame(height: 50)
        )
    }
}

// MARK: - PREVIEW

struct CustomTimerPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimerPickerView()
            .previewLayout(.device)
    }
}
