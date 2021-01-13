//
//  FlightSeqListView.swift
//  Logging
//
//  Created by Bethany Morris on 1/5/21.
//

import SwiftUI

struct FlightSeqListView: View {
    var body: some View {
        VStack(spacing: 0) {
            FlightSeqListHeader()
                .padding(.vertical)
            CellLine()
            ScrollView {
                VStack(spacing: 0) {
                    FlightSeqCellView()
                    FlightSeqCellView()
                    FlightSeqCellView()
                }
            }
        }
    }
}

struct FlightSeqListHeader: View {
    let size: CGFloat = 10
    
    var body: some View {
        HStack {
            // figure out how to space correctly without hidden text?
            RegularText(text: "A.", size: 14)
                .hidden()
            HStack {
                ListHeaderText(text: "MISSION\nNUMBER", size: size, lines: 2)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "MISSION\nSYMBOL", size: size, lines: 2)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "FROM\n(ICAO)", size: size, lines: 2)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "TO\n(ICAO)", size: size, lines: 2)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "TAKE OFF\nTIME (Z)", size: size, lines: 2)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "LAND\nTIME (Z)", size: size, lines: 2)
                    .frame(width: 46, height: 28)
            }
            HStack {
                ListHeaderText(text: "TOTAL\nTIME", size: size, lines: 2)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "TOUCH\n& GO", size: size, lines: 2)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "FULL\nSTOP", size: size, lines: 2)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "TOTAL", size: size)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "SORTIES", size: size)
                    .frame(width: 46, height: 28)
                ListHeaderText(text: "SPECIAL\nUSE", size: size, lines: 2)
                    .frame(width: 46, height: 28)
            }
            Image(systemName: "plus.circle")
                .padding(.trailing)
                .hidden()
            Image(systemName: "plus.circle")
                .hidden()
        }
    }
}

struct FlightSeqListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSeqListView()
            .previewLayout(.sizeThatFits)
        FlightSeqListView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
