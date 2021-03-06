//
//  Constants.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

// MARK: - LAYOUT CONSTATNS

/// padding 레이아웃 값
let horizontalPadding: CGFloat = 16.0
let verticalPadding: CGFloat = 8.0


/// frame 레이아웃 값
let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width

let headerHeightRatio = (0.4, 0.5)
let centerHeightRatio = (0.1, 0.2)
let footerHeightRatio = (0.1, 0.2)

struct FrameConstant {
    var min: CGSize
    var max: CGSize
}

let headerFrame = FrameConstant(
    min: .init(width: 0, height: screenHeight * headerHeightRatio.0),
    max: .init(width: 0, height: screenHeight * headerHeightRatio.1)
)


let centerFrame = FrameConstant(
    min: .init(width: 0, height: screenHeight * centerHeightRatio.0),
    max: .init(width: 0, height: screenHeight * centerHeightRatio.1)
)


let footerFrame = FrameConstant(
    min: .init(width: 0, height: screenHeight * footerHeightRatio.0),
    max: .init(width: 0, height: screenHeight * footerHeightRatio.1)
)

/// corner radius 레이아웃 값
let myCornerRadius: CGFloat = 9.0

/// button size 레이아웃 값
let buttonSize: CGFloat = 90.0

/// dateFormatter 설정
let countdownDateFormatter: DateFormatter = {
    var dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "mm:ss"
    return dateFormatter
} ()

let currentDateFormatter: DateFormatter = {
    var dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm a"
    dateFormatter.locale = Locale(identifier: "ko_KR")
    return dateFormatter
} ()

/// Alarm을 위한 DateFormatter
let merediemDateFormatter: DateFormatter = {
    var dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "a"
    dateFormatter.locale = Locale(identifier: "ko_KR")
    return dateFormatter
}()

let alarmTimeFormatter: DateFormatter = {
    var dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter
}()
