//
//  FormView.swift
//  Logging
//
//  Created by Bethany Morris on 1/4/21.
//

import SwiftUI

struct FormView: View {
  
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
//                    BoldText(text: "AFTO Form 781", size: 18)
//                        .padding()
//                    Spacer()
                    TextAndIconButton(text: "SHARE", color: .pblSlate, icon: "square.and.arrow.up", action: {
                        print("Me Share one day")
                    })
                    TextAndIconButton(text: "PRINT", color: .pblSlate, icon: "printer.fill", action: {
                        print("Make it print")
                    })
                
            }
            
 
           
                MissionDataView()
                    .padding()
                     
        
               AircrewListView()
                    .padding()
                 
//
//                AircrewDataView()
//                    .padding()

        }
    }
}

 struct FormView_Previews: PreviewProvider {
   
    static var previews: some View {

        FormView()
         
            .previewLayout(.sizeThatFits)

        FormView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
      


     }
 }
