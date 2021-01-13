//
//  Form781Main.swift
//  DemoNav
//
//  Created by John Bethancourt on 1/12/21.
//

import SwiftUI
 
struct MainFormView : View {
    
    var form: Form781
    
    @Binding var demoType: DemoType
    
    @State var date:        String = ""
    @State var mds:         String = ""
    @State var serial:      String = ""
    @State var remarks:     String = ""
    @State var flights:     [Flight] = [Flight]()
    @State var aircrew:     [AircrewMember] = [AircrewMember]()
    
    var body: some View {
        
        VStack {
            switch demoType {
            case .original:
                ScrollView{ FormView() }
            case .longForm:
                
                Form {
                    Section(header: Text("Main").font(.headline)) {
                        TextField("Date",   text:$date)
                        TextField("MDS",    text:$mds)
                        TextField("SERIAL", text:$serial)
                    }
                    Section(header: Text("Flights").font(.headline)) {
                        
                        HStack {
                            Text("Mission #")
                                .padding(.trailing, 60)
                            Text("Mission Symbol")
                                .padding(.trailing, 70)
                            Text("From ICAO")
                                .padding(.trailing, 90)
                            Text("To ICAO")
                        }.font(.headline)
                        List{
                            ForEach(flights, id: \.self) { flight in
                                FlightCard(flight: flight)
                            }
                            .onDelete(perform: deleteFlight)
                        }
                         
                    }
                    
                    Section(header: Text("Aircrew").font(.headline)) {
                        HStack {
                            Text("Organization").padding(.trailing, 100)
                            Text("SSAN Last 4").padding(.trailing, 140)
                            Text("Last Name")
                        }
                        .font(.headline)
                        List{
                            ForEach(aircrew, id: \.self) { member in
                                PersonCard(member: member)
                            }
                            .onDelete(perform: deleteAircrew)
                        }
                        
                    }
                    Section(header: Text("Remarks").font(.headline)) {
                        TextField("REMARKS", text:$remarks)
                    }
                }.navigationBarItems(trailing: EditButton())
            
            case .shortForm:
                Form {
                    Section(header: Text("Main").font(.headline)) {
                        TextField("Date",   text:$date)
                        TextField("MDS",    text:$mds)
                        TextField("SERIAL", text:$serial)
                    }
                    Section(header: Text("Flights").font(.headline)) {
                   
                        NavigationLink(
                            destination: AllFlightCards(flights: flights),
                            label: {
                                Text("Flights")
                            })
                    }
                    
                    Section(header: Text("Aircrew").font(.headline)) {
                        NavigationLink(
                            destination: AllPersonCards(members: aircrew),
                            label: {
                                Text("Aircrew")
                            })
                    }
                    
                    Section(header: Text("Remarks").font(.headline)) {
                        TextField("REMARKS", text:$remarks)
                    }
                    .navigationBarTitle(Text("Current Form"))
                }
            }
            Spacer()
        }
        .onAppear{
            date = form.date
            mds = form.mds
            serial = form.serial
            remarks = form.remarks
            flights = form.flights
            aircrew = form.aircrewData
        }
    }
    func deleteAircrew(at offsets: IndexSet) {
       aircrew.remove(atOffsets: offsets)
   }
    func deleteFlight(at offsets: IndexSet) {
       aircrew.remove(atOffsets: offsets)
   }
}

struct AllFlightCards: View{
    
    @State var flights: [Flight]
    
    var body: some View{
        VStack{
            HStack {
                Text("Mission #").padding(.trailing, 60)
                Text("Mission Symbol").padding(.trailing, 70)
                Text("From ICAO").padding(.trailing, 90)
                Text("To ICAO")
            }.font(.headline)
            List{
                ForEach(flights, id: \.self) { flight in
                    FlightCard(flight: flight)
                }.onDelete(perform: delete)
            }
        }.navigationBarTitle(Text("Flights"))
        .navigationBarItems(trailing: EditButton())
     
    }
    func delete(at offsets: IndexSet) {
       flights.remove(atOffsets: offsets)
   }
    
}

struct FlightCard: View {
    
    var flight: Flight
    
    @State var missionNumber: String = ""
    @State var missionSymbol: String = ""
    @State var fromICAO: String = ""
    @State var toICAO: String = ""
    
    var body: some View {
        
        HStack {
            TextField("Mission #", text: $missionNumber)
            TextField("Mission Symbol", text: $missionSymbol)
            TextField("From ICAO", text: $fromICAO)
            TextField("To ICAO", text: $toICAO)
        }
        .onAppear{
            missionNumber = flight.missionNumber
            missionSymbol = flight.missionSymbol
            fromICAO = flight.fromICAO
            toICAO = flight.toICAO
            print("appear")
        }
         
    }
}

struct AllPersonCards: View {
    
    @State var members: [AircrewMember]
    var body: some View {
        
        VStack{
            HStack {
                Text("Organization").padding(.trailing, 100)
                Text("SSAN Last 4").padding(.trailing, 140)
                Text("Last Name")
            }.font(.headline)
            List{
                ForEach(members, id: \.self) { member in
                    PersonCard(member: member)
                }.onDelete(perform: delete)
            }
            
            .navigationBarTitle(Text("Aircrew"))
            .navigationBarItems(trailing: EditButton())
        }
        
    }
    
    func delete(at offsets: IndexSet) {
       members.remove(atOffsets: offsets)
   }
}

struct PersonCard: View {
    
    @State var flyingOrg: String = ""
    @State var ssan: String = ""
    @State var lastName: String = ""
    
    var member: AircrewMember
    
    var body: some View {
        HStack{
            TextField("Org", text: $flyingOrg)
            TextField("SSAN", text: $ssan)
            TextField("Last Name", text: $lastName)
        }.onAppear{
            flyingOrg = member.flyingOrg
            ssan = member.ssan
            lastName = member.lastName
        }
    }
}

struct MainFormView_Previews: PreviewProvider {
    
    static let forms = Faker.getFakeForms()
    
    static var previews: some View {
        
        MainFormView(form: forms.first!, demoType: .constant(.shortForm))
    }
}
