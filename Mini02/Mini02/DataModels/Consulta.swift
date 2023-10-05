//
//  Consulta.swift
//  Mini02
//
//  Created by Kaua Miguel on 04/10/23.
//

import Foundation


struct Consulta{
    
    let consultId : Int
    
    //This array will have all the blood exams
    var bloodExams: BloodExamModel?
    
    //This array will have all the US exams
    var ultraSoundExams: UltrasoundExam?
    
    let date : Date
    
    let trimesteer : Int
}
