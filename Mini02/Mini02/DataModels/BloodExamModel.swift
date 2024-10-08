//
//  BloodExamModel.swift
//  Mini02
//
//  Created by Daniel Ishida on 22/09/23.
//

import Foundation

//MARK: BLOOD TYPE ENUM
enum BloodType: String, CaseIterable {
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
enum VdrlExam:String, CaseIterable{
    /* the titers are reported in a pattern of doubling,
     like 1:4, 1:8, 1:16, 1:32, and so forth*/
    case none = "Não reagente"
    case four  = "1:4"
    case eight = "1:8"
    case sixteen = "1:16"
    case thirtyTwo = "1:32"
    case over = "acima de 1:32"
}

//MARK: UREA EXAM STRUCT
struct ureaExam{
    /* The most commonly used measure to express blood urea levels
     is milligrams of urea per deciliter of blood (mg/dL).*/
    var mg:Int
    var dL:Float
}

// MARK: FULL BLOOD EXAMS INFOS
struct BloodExamModel{
    var consultNumber : Int
    var bloodType: BloodType
    var toxoplasmosis:Toxoplasmosis
    var hiv:Bool
    var vdrl:String //checks if pacient has syphilis
    
    var urea:ureaExam
    var creatine:Float
    
    var ht:Float // level of hemoglobines in the blood?
    var hb:Float // level of red blood cells?
    
    /*Adults: Approximately 4,000 to 11,000 white
     blood cells per microliter (µL) of blood.*/
    var whiteCells: Int
    
    var platelets:Int
    
    /*In fasting (before eating): Less than 95, between 95 and
     125 considered pre-diabetes. over that is considered diabete positive*/
    var glucose:Int 
    
    
}
