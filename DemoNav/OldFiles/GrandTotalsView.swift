//
//  GrandTotalsView.swift
//  Logging
//
//  Created by Bethany Morris on 1/7/21.
//

import SwiftUI

struct GrandTotalsView: View {
    let size: CGFloat = 14
    
    var body: some View {
        HStack {
            
            
                BoldText(text: "GRAND TOTALS", size: size)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            
            HStack {
                 
                ListHeaderText(text: "0", size: size)
                    .frame(width:30, height:20)
                    .padding(.leading, 100)
                ListHeaderText(text: "0", size: size)
                    .frame(width:30, height:20)
                ListHeaderText(text: "0", size: size)
                    .frame(width:30, height:20)
                ListHeaderText(text: "0", size: size)
                    .frame(width:30, height:20)
                ListHeaderText(text: "0", size: size)
                    .frame(width:30, height:20)
            }
            Image(systemName: "plus.circle")
                .hidden()
            Button(action: {
                print("EditButton tapped")
            }) {
                Image(systemName: "plus.circle")
                    .foregroundColor(.pblSlate)
                    .padding(.trailing)
            }
        }
        .background(Color.pblMistBG)
    }
}

struct GrandTotalsView_Previews: PreviewProvider {
    static var previews: some View {
        GrandTotalsView()
            .previewLayout(.sizeThatFits)
        GrandTotalsView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
