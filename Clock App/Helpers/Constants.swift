//
//  Constants.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

// MARK: - LAYOUT CONSTATNS

let horizontalPadding: CGFloat = 16.0
let verticalPadding: CGFloat = 8.0

struct FrameConstant {
    var min: CGSize
    var max: CGSize
}

let headerFrame = FrameConstant(min: .init(width: 0, height: 300), max: .init(width: 0, height: 400))
let centerFrame = FrameConstant(min: .init(width: 0, height: 200), max: .init(width: 0, height: 300))
let footerFrame = FrameConstant(min: .init(width: 0, height: 100), max: .init(width: 0, height: 200))
