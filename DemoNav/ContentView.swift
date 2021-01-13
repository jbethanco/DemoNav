//
//  ContentView.swift
//  DemoNav
//
//  Created by John Bethancourt on 1/12/21.
//

import SwiftUI

enum DemoType: String {
    case original = "Original"
    case longForm = "Long Form"
    case shortForm = "Short Form"
    
}

struct ContentView: View {
    
    @ObservedObject var faker = Faker()
    @State private var demoType: DemoType = .original
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "primary")!]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "primary")!]
    }
    var body: some View {
        
        VStack{
            NavigationView{
                VStack {
                    ForEach(faker.forms, id: \.self) { form in
                        NavigationLink(destination: MainFormView(form:form, demoType: $demoType
                        )
                        ) {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.pblMistBG)
                                    .frame(width: 700, height: 100, alignment: .center)
                                    .shadow(color: Color("primary"), radius: 5, x: 5, y: 5)
                                    .padding()
                                HStack{
                                    VStack(alignment: .leading){
                                         
                                            HStack(spacing: 5){
                                                Image(systemName: "calendar")
                                                    .padding(.leading, 10)
                                                Text(form.date)
                                                    .multilineTextAlignment(.leading)
                                                     
                                                    .padding(.leading, 1)
                                                    .padding(.trailing, 40)
                                                Image(systemName: "square.and.arrow.up")
                                                Text("Last Shared:   21 Jul 2020")
                                                Spacer()
                                                 
                                              
                                                
                                            }.padding(1)
                                            HStack (spacing: 5){
                                                Image(systemName: "airplane")
                                                    .padding(.leading, 10)
                                                    
                                                Text(form.mds)
                                                    .multilineTextAlignment(.leading)
                                                    .padding(.leading, 1)
                                                    .padding(.trailing, 87)
                                                Image(systemName: "envelope")
                                                Text("Last Emailed: 22 Jul 2020")
                                                Spacer()
                                                Image(systemName: "chevron.right")
                                                    .padding(.trailing, 20)
                                                
                                            }.padding(1)
                                            HStack(spacing: 5){
                                                Image(systemName: "number")
                                                    .padding(.leading, 10)
                                                Text(form.serial)
                                                    .multilineTextAlignment(.leading)
                                                    
                                                    .padding(.leading, 1)
                                                Spacer()
                                            }.padding(1)
                                        .frame(width: 200)
                                    }.frame(width: 700, height: 100)
                                    
                                }
                                
                                
                            }
                        }
                    }
                    Spacer()
                } .navigationBarTitle(Text("AFTO Form 781s"))
            }
            .navigationViewStyle(StackNavigationViewStyle())
            Spacer()
            VStack{
                Text(demoType.rawValue)
                HStack(alignment:.center){
                    Button{
                        self.demoType = .longForm
                    } label:{
                        Text("Long Form")
                    }
                    Spacer()
                    Button{
                        self.demoType = .shortForm
                    } label:{
                        Text("Short Form")
                    }
                    Spacer()
                    Button{
                        self.demoType = .original
                    } label:{
                        Text("Original")
                    }
                }.padding()
                .frame(height:40)
            }
            
        }.accentColor(Color("primary"))
        .foregroundColor(Color("primary"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
