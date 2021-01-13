//
//  Data.swift
//  DemoNav
//
//  Created by John Bethancourt on 1/12/21.
//

import Foundation

class Faker : ObservableObject {
    
    @Published var forms: [Form781] = Faker.getFakeForms()
    
    static func getFakeForms() -> [Form781] {
        
        
        let flight1a = Flight(missionNumber: "AAM512771057", missionSymbol: "M6CA", fromICAO: "KADW", toICAO: "OAKB")
        let flight1b = Flight(missionNumber: "BAM523433233", missionSymbol: "M6CB", fromICAO: "OAKB", toICAO: "KADW")

        let aircrewMember1a = AircrewMember(flyingOrg: "0015", ssan: "1323", lastName: "Smith")
        let aircrewMember1b = AircrewMember(flyingOrg: "0015", ssan: "2344", lastName: "Jones")
        let aircrewMember1c = AircrewMember(flyingOrg: "0015", ssan: "3555", lastName: "Park")
        
        let form1 = Form781(order: 1, date: "25 Jun 2020", mds: "C017A", serial:"10-0019", remarks: "nada", flights: [flight1a, flight1b], aircrewData: [aircrewMember1a, aircrewMember1b, aircrewMember1c])
        
        let flight2a = Flight(missionNumber: "CM2343234323", missionSymbol: "M6DA", fromICAO: "RJTY", toICAO: "RJSM")
        let flight2b = Flight(missionNumber: "DRBB32343233", missionSymbol: "M6DB", fromICAO: "RJSM", toICAO: "RJTY")

        let aircrewMember2a = AircrewMember(flyingOrg: "0015", ssan: "4222", lastName: "Franks")
        let aircrewMember2b = AircrewMember(flyingOrg: "0015", ssan: "5322", lastName: "Todd")
        let aircrewMember2c = AircrewMember(flyingOrg: "0015", ssan: "6255", lastName: "Sanderson")
        
        let form2 = Form781(order: 2, date: "26 Jun 2020", mds: "C017A", serial:"10-0020", remarks: "nada", flights: [flight2a, flight2b], aircrewData: [aircrewMember2a, aircrewMember2b, aircrewMember2c])
        
        let flight3a = Flight(missionNumber: "ERQE23423233", missionSymbol: "M6ZA", fromICAO: "PHNL", toICAO: "OAIX")
        let flight3b = Flight(missionNumber: "FAM523433233", missionSymbol: "M6ZB", fromICAO: "OAIX", toICAO: "PHNL")

        let aircrewMember3a = AircrewMember(flyingOrg: "0015", ssan: "7323", lastName: "Morris")
        let aircrewMember3b = AircrewMember(flyingOrg: "0016", ssan: "8344", lastName: "Misik")
        let aircrewMember3c = AircrewMember(flyingOrg: "0019", ssan: "9555", lastName: "Hoch")
        
        let form3 = Form781(order: 3 ,date: "27 Jun 2020", mds: "C017A", serial:"10-0021", remarks: "This was the funnest mission ever.", flights: [flight3a, flight3b], aircrewData: [aircrewMember3a, aircrewMember3b, aircrewMember3c])
         
        return [form1, form2, form3]
    }
}


class Form781: Identifiable, Comparable, Hashable {
    internal init(order: Int? = nil, id: UUID = UUID(), date: String = "", mds: String = "", serial: String = "", remarks: String = "", flights: [Flight]? = nil, aircrewData: [AircrewMember]? = nil) {
        self.order = order
        self.id = id
        self.date = date
        self.mds = mds
        self.serial = serial
        self.remarks = remarks
        self.flights = flights
        self.aircrewData = aircrewData
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(serial)
    }
    
    static func < (lhs: Form781, rhs: Form781) -> Bool {
        return lhs.order > rhs.order
    }
    
    static func == (lhs: Form781, rhs: Form781) -> Bool {
        return lhs.order == rhs.order
    }
    
    var order: Int!
    var id = UUID()
    var date: String = ""
    var mds: String = ""
    var serial: String = ""
    var remarks: String = ""
    var flights: [Flight]!
    var aircrewData: [AircrewMember]!
    
    
}

class Flight: Identifiable, Hashable {
    static func == (lhs: Flight, rhs: Flight) -> Bool {
        return lhs.id == rhs.id
    }
     
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    internal init(id: UUID = UUID(), missionNumber: String = "", missionSymbol: String = "", fromICAO: String = "", toICAO: String = "") {
        self.id = id
        self.missionNumber = missionNumber
        self.missionSymbol = missionSymbol
        self.fromICAO = fromICAO
        self.toICAO = toICAO
    }
    
    var id = UUID()
    var missionNumber: String = ""
    var missionSymbol: String = ""
    var fromICAO: String = ""
    var toICAO: String = ""
}

class AircrewMember : Identifiable, Hashable{
    static func == (lhs: AircrewMember, rhs: AircrewMember) -> Bool {
        return lhs.id == rhs.id
    }
     
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    
    internal init(id: UUID = UUID(), flyingOrg: String = "", ssan: String = "", lastName: String = "") {
        self.id = id
        self.flyingOrg = flyingOrg
        self.ssan = ssan
        self.lastName = lastName
    }
    
    var id = UUID()
    var flyingOrg: String = ""
    var ssan: String = ""
    var lastName: String = ""
}


