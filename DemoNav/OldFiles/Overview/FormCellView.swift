//
//  FormCellView.swift
//  Logging
//
//  Created by Bethany Morris on 1/8/21.
//

import SwiftUI

struct FormCellView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.pblMistBG)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 80)
                .padding(.horizontal)
                .shadow(radius: 3, y: 3)
            HStack {
                VStack(alignment: .leading) {
                    RegularText(text: "AFTO FORM 781", size: 16)
                    RegularText(text: "Mission #00000", size: 12)
                }
                    .padding()
                Spacer()
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.pblSlate)
                    BoldText(text: "COMPLETE", size: 12)
                }
                Spacer()
                Button(action: {
                    print("EditButton tapped")
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .fill(Color.pblSlate)
                            .frame(width: 150, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        BoldText(text: "REVIEW & SHARE", size: 12, color: .white)
                            .foregroundColor(.pblSlate)
                    }
                }
                Spacer()
                HStack {
                    Button(action: {
                        print("EditButton tapped")
                    }) {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.pblSlate)
                    }
                    Button(action: {
                        print("DeleteButton tapped")
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.pblSlate)
                    }
                    .padding()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct FormCellView_Previews: PreviewProvider {
    static var previews: some View {
        FormCellView()
            .previewLayout(.sizeThatFits)
        FormCellView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
