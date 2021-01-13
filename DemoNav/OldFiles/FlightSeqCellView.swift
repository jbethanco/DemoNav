//
//  FlightSeqCellView.swift
//  Logging
//
//  Created by Bethany Morris on 1/6/21.
//

import SwiftUI

struct FlightSeqCellView: View {
    @State private var missionNumber: String = ""
    @State private var missionSymbol: String = ""
    @State private var fromICAO: String = ""
    @State private var toICAO: String = ""
    @State private var takeOffTime: String = ""
    @State private var landTime: String = ""
    @State private var totalTime: String = ""
    @State private var touchGo: String = ""
    @State private var fullStop: String = ""
    @State private var totalLandings: String = ""
    @State private var sorties: String = ""
    @State private var specialUse: String = ""
    
    let size: CGFloat = 14
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                RegularText(text: "A.", size: 14)
                HStack {
                    RegularTextField(placeholder: "SIM", field: $missionNumber, size: size)
                        .frame(width: 44, height: 20)
                    RegularTextField(placeholder: "Q1", field: $missionSymbol, size: size)
                        .frame(width: 55, height: 20)
                    RegularTextField(placeholder: "KCHS", field: $fromICAO, size: size)
                        .frame(width: 44, height: 20)
                    RegularTextField(placeholder: "KCHS", field: $toICAO, size: size)
                        .frame(width: 44, height: 20)
                    RegularTextField(placeholder: "1800", field: $takeOffTime, size: size)
                        .frame(width: 44, height: 20)
                    RegularTextField(placeholder: "2100", field: $landTime, size: size)
                        .frame(width: 44, height: 20)
                }
                HStack {
                    RegularTextField(placeholder: "3.0", field: $totalTime, size: size)
                        .frame(width: 44, height: 20)
                    RegularTextField(placeholder: "--", field: $touchGo, size: size)
                        .frame(width: 44, height: 20)
                    RegularTextField(placeholder: "4", field: $fullStop, size: size)
                        .frame(width: 44, height: 20)
                    RegularTextField(placeholder: "4", field: $totalLandings, size: size)
                        .frame(width: 44, height: 20)
                    RegularTextField(placeholder: "1", field: $sorties, size: size)
                        .frame(width: 44, height: 20)
                    RegularTextField(placeholder: "--", field: $specialUse, size: size)
                        .frame(width: 44, height: 20)
                }
                Spacer()
                Button(action: {
                    print("DeleteButton tapped")
                }) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.pblSlate)
                }
            }
                .padding(.vertical)
            Divider()
        }
    }
}

struct FlightSeqCellView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSeqCellView()
            .previewLayout(.sizeThatFits)
        FlightSeqCellView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
