//
//  Consulta.swift
//  Mini02
//
//  Created by Kaua Miguel on 04/10/23.
//

import Foundation


struct Consulta{
    
    var consultId : Int
    
    //This array will have all the blood exams
    var bloodExams: BloodExamModel?
    
    //This array will have all the US exams
    var ultraSoundExams: UltrasoundExam?
    
    var date : Date
    
    var trimesteer : Int
    
    //Dados de rotina de todos os exames
    var routineData : RoutineDataModel?
    
    var dueDate : DueDateModel?
    
    var plannedPregnancy : PregnancyPlanningModel?
    
    var riskPregnancy : PregnancyRiskModel?
    
    var pregnancyClassificationModel : PregnancyClassificationModel?
}
