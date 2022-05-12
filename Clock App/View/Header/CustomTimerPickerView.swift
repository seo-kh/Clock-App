//
//  CustomTimerPickerView.swift
//  Clock App
//
//  Created by 서광현 on 2022/05/12.
//

import SwiftUI

struct CustomTimerPickerViewComponent: View {
    
    // MARK: - PROPERTIES
    
    var unit: String
    let time: Range<Int>
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { value in
                VStack(spacing: 0) {
                    ForEach(time, id: \.self) { second in
                        HStack {
                            GeometryReader { geo in
                                Text("\(second)")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                                    .frame(width: 50, height: 50)
                                    .id(second)
                                    .rotation3DEffect(.degrees(Double(geo.frame(in: .global).maxY) / 2.5 - 200), axis: (x: 1.0, y: 0.0, z: 0.0), anchorZ: -2)
                                    
                            } //: GEOMETRY
                            .frame(width: 50, height: 50)
                        } //: HSTACK
                    } //: LOOP
                } //: VSTACK
                .padding(.vertical, 125)
            }
        } //: SCROLL
        .frame(maxWidth: 100, maxHeight: 300)
        .overlay(
            Text(unit)
                .font(.title2)
                .fontWeight(.bold)
                .offset(x: 32)
            , alignment: .center
        )
    }
}

struct CustomTimerPickerView: View {
    var body: some View {
        HStack {
            CustomTimerPickerViewComponent(unit: "H", time: 0..<12)
            CustomTimerPickerViewComponent(unit: "M", time: 0..<60)
            CustomTimerPickerViewComponent(unit: "S", time: 0..<60)
        }
        .padding()
        .overlay(alignment: .center) {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.white.opacity(0.2))
                .frame(height: 50)
        }
    }
}

// MARK: - PREVIEW

struct CustomTimerPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimerPickerView()
            .previewLayout(.device)
    }
}
