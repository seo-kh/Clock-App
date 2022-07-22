//
//  AlarmSettingView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/08.
//

import SwiftUI

struct AlarmSettingView: View {
    @EnvironmentObject var alarmViewModel: AlarmViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            // CANCEL
            Button {
                alarmViewModel.isSetting = false
            } label: {
                Text("취소")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //: IMAGE
            Image(systemName: "bed.double.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.mint, .cyan.opacity(0.5))
                .imageScale(.large)
            
            //: TITLE
            Text(
"""
이제 건강 앱에서 수면 설정 가능
""")
            .font(.system(size: 35))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            
            //: DESCRIPTION
            Text("""
새로운 수면 시간 지정을 일단 설정하면, 시계에서 해당 알람을 변경할 수 있습니다.\n\n 또한, 수면 목표를 설정하고 취침 준비 시간 동안의 일상적인 패턴을 생성하는 등 기타 기능을 설정 할 수 있습니다.
""")
            .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("건강 앱에서 설정")
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(.vertical, 7)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .cornerRadius(12.0)
            .padding(.horizontal, 5)
            
            Spacer().frame(height: 30)
            
            
        } //: VSTACK
        .padding()
    }
}
