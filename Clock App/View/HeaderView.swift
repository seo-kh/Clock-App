//
//  HeaderView.swift
//  Clock App
//
//  Created by 서광현 on 2022/04/23.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    
    @State private var timeInterval: TimeInterval = 0.0
    
    // MARK: - BODY

    var body: some View {
        PickerHeaderView(duration: $timeInterval)
        
    }
}

// MARK: - PREVIEW

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
