//
//  LabelAlarmView.swift
//  Clock App
//
//  Created by 서광현 on 2022/07/11.
//

import SwiftUI

fileprivate enum FocusField: Hashable {
    case field
}

struct LabelAlarmView: View {
    @Binding var label: String
    @FocusState private var focus: FocusField?
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        TextField(label, text: $label)
        .padding(10)
        .background(Color.secondary.opacity(0.3))
        .cornerRadius(15.0)
        .padding()
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .submitLabel(.done)
        .focused($focus, equals: .field)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                /// Anything over 0.5 seems to work
                self.focus = .field
            }
        }
        .onSubmit {
            switch focus {
            case .field:
                dismiss()
            default:
                focus = nil
            }
        }
        
    }
}

struct LabelAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        LabelAlarmView(label: .constant("안함"))
    }
}
