//
//  BloodExamModel.swift
//  Mini02
//
//  Created by Daniel Ishida on 22/09/23.
//

import Foundation

//MARK: BLOOD TYPE ENUM
enum BloodType: String{
    case APositive = "A+"
    
    case ANegative = "A-"
    
    case BPositive = "B+"
    
    case BNegative = "B-"
    
    case ABPositive = "AB+"
    
    case ABNegative = "AB-"
    
    case OPositive = "O+"
    
    case ONegative = "O-"
}

//MARK: TOXOPLASMOSIS STRUCT
struct Toxoplasmosis{
    //True meaning *positive* and false meaning *negative*
    var igm : Bool
    var igg : Bool
}

//MARK: VDRL EXAM ENUM
enum VdrlExam:String{
    /* the titers are reported in a pattern of doubling,
     like 1:4, 1:8, 1:16, 1:32, and so forth*/
    case none = "Não reagente"
    case four  = "1:4"
    case eight = "1:8"
    case sixteen = "1:16"
    case thirtyTwo = "1:32"
    case over = "acima de 1:32"
    
}

// MARK: FULL BLOOD EXAMS INFOS
struct BloodExam{
    var bloodType: BloodType
    var toxoplasmosis:Toxoplasmosis
    var hiv:Bool
    var vdrl:VdrlExam //checks if pacient has syphilis
    
    /*If the vdrl exams is 1:16 or over var sysphilis is true,
     below that is not confirmed and other exams are made to check*/
    var syphilis:Bool
    
    var tci: Bool
    var tcd: Bool
    
    
    
}
