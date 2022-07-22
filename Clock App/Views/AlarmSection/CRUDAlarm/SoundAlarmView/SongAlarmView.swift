//
//  SongAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/17.
//

import SwiftUI

struct SongAlarmView: View {
    @Environment(\.dismiss) var dismiss
    @State private var song: String = ""
    
    var body: some View {
        VStack {
            Text("음악 앱에서 노래를 다운로드하십시오.")
                .font(.title2)
                .fontWeight(.bold)
            Text("다운로드된 음악만 사용할 수 있습니다.")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Button(action: {
                //
            }, label: {
                Text("음악 앱 열기")
                    .fontWeight(.semibold)
                    .frame(width: 250)
                    .padding(4)
            })
            .buttonStyle(.borderedProminent)
            .padding(.top, 2)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing, content: {
            Button {
                dismiss()
            } label: {
                Text("취소")
            }

        })
        .padding()
    }
}

struct SongAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        SongAlarmView()
    }
}
