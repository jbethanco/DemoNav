//
//  OverviewView.swift
//  Logging
//
//  Created by Pete Hoch on 1/5/21.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                FormCellView()
                FormCellView()
                FormCellView()
            }
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
            .previewLayout(.sizeThatFits)
        OverviewView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
