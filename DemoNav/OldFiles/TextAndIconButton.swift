//
//  TextAndIconButton.swift
//  Logging
//
//  Created by Bethany Morris on 1/5/21.
//

import SwiftUI

struct TextAndIconButton: View {
    let text: String
    let color: Color
    let icon: String
    let action: () -> Void

    var body: some View {
        
        Button(action: {
            action()
        }) {
            HStack {
                BoldText(text: text, size: 12, color: color)
                Image(systemName: icon)
                    .foregroundColor(color)
            }
        }
        .padding()
    }
}

struct TextAndIconButton_Previews: PreviewProvider {
    static var previews: some View {
        TextAndIconButton(text: "PRINT", color: .pblSlate, icon: "info.circle", action: {
            print("TextAndIconButton tapped")
        })
            .previewLayout(.sizeThatFits)
        TextAndIconButton(text: "PRINT", color: .pblSlate, icon: "info.circle", action: {
            print("TextAndIconButton tapped")
        })
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
