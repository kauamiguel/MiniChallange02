//
//  EmergencyContact.swift
//  Mini02
//
//  Created by Fabio Freitas on 28/09/23.
//

import Foundation

enum EmergencyContactRelation: String {
    case partner = "Companheiro"
    case friend = "Amigo"
    case relative = "Familiar"
    case other = "Outro(a)"
}
struct EmergencyContactModel {
    let name: String
    let phone: String
    let relation: EmergencyContactRelation
}
