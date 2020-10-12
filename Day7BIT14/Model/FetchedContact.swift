//
//  FetchedContact.swift
//  Day7BIT14
//
//  Created by Jlius Suweno on 07/10/20.
//

import Foundation

class FetchedContact {
    var firstName: String = "defaultFirstName"
    var lastName: String = "defaultLastName"
    var telephone: String = "-"
    
    init(firstName: String, lastName: String, telephone: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.telephone = telephone
    }
}
