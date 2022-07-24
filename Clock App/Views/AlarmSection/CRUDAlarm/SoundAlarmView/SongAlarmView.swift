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
        Group {
            if song.isEmpty {
                musicApp()
            } else {
                List {
                    Text(song)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("보관함")
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("취소")
                }

            }
        })
        .searchable(text: $song, placement: SearchFieldPlacement.navigationBarDrawer(displayMode: .always), prompt: "보관함")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

extension SongAlarmView {
    func musicApp() -> some View {
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
    }
}

struct SongAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        SongAlarmView()
    }
}
