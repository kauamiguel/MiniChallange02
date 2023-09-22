//
//  Vaccines.swift
//  Mini02
//
//  Created by Kaua Miguel on 20/09/23.
//

import Foundation

struct DoseVaccines {
    var date : Date
    var isVaccined : Bool
}

class Vaccines{
    var hepatiteB : [DoseVaccines]?
    var influenza : DoseVaccines?
    var antitetanic : [DoseVaccines]?
    var gripe : DoseVaccines?
    var dTpa : DoseVaccines?
}
