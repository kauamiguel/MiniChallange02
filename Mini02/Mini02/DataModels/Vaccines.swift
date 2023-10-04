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
    var numberOfDose : Int
}

struct Vaccines{
    var hepatiteB : [DoseVaccines]
    var influenza : DoseVaccines
    var antitetanic : [DoseVaccines]
    var flue : DoseVaccines
    var dTpa : DoseVaccines
}
