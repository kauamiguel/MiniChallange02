//
//  PersonalBGModel.swift
//  Mini02
//
//  Created by Daniel Ishida on 16/09/23.
//

import Foundation


// Any of these is considered as a high risk pregnacy
struct PersonalBGModel: BackgroundInfo{
    
    var tabagism : Bool = false
    
    var hypertension : Bool = false
    
    var diabetes : Bool = false
    
    var heartCondition : Bool = false
    
    var urinaryInfection : Bool = false
    
    var other : [String:Bool]?
}


