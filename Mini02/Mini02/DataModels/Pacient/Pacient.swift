//
//  PacientModel.swift
//  Mini02
//
//  Created by Daniel Ishida on 16/09/23.
//

import Foundation

// Background data that goes in both personal bg or family bg, although family bg cases does not always mean a high risk pregnancy.
protocol BackgroundInfo{
    var tabagism : Bool {get}
    
    var hypertension : Bool {get}
    
    var diabetes : Bool {get}
    
    var heartCondition : Bool {get}
    
    var urinaryInfection : Bool {get}
    
    var other : [String:Bool]? {get}
}

// Protocol defining every information a pacient needs to have
protocol PacientInfo{
    var firstName : String { get }
    var secondName : String { get }
    var nickName : String? { get }
    
    var age : Int { get }
    var height : Float { get  }
    var weight : Float { get }
    
    var personalBG:PersonalBG {get}
    var familyBG:FamilyBG {get}
}


struct Pacient:PacientInfo{
    var firstName : String
    var secondName : String
    var nickName : String? // How the pacient likes to be called
    
    var age : Int //If over 35 OR under 15 -> HIGH RISK PREGNACY
    var height : Float
    var weight : Float
    
    //This struct has all the personal background information data
    var personalBG = PersonalBG()
    
    //This struct has all the family background information data
    var familyBG = FamilyBG()
    
    //This array will have all the blood exams
    var bloodExams: [BloodExamModel]
    
    //This array will have all the US exams
    var USoundExams: [UltrasoundExam]
}
