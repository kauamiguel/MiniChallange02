//
//  CoreDataFunctions.swift
//  Mini02
//
//  Created by Kaua Miguel on 26/09/23.
//

import Foundation
import CoreData
import UIKit


class CoreDataFunctions{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistenceContainer.viewContext
    
    var pacient : PacientModel?
    
    func saveContext() {
        do{
            try context.save()
        }catch{
            print("Error saving the context")
        }
    }
    
    func fetchPacient(){
        do{
            pacient = try context.fetch(PacientModel.fetchRequest()).first
        }catch{
            print("Error fetching of the pacient")
        }
    }
    
    
    func addPersonalInfo(firstName : String, secondName : String, nickName : String, age : Int, height : Float , weight : Float){
        
        let pacientSaved = PacientModel(context: context)
        pacientSaved.nickName = nickName
        pacientSaved.age = Int64(age)
        pacientSaved.firstName = firstName
        pacientSaved.secondName = secondName
        pacientSaved.height = height
        pacientSaved.weight = weight
        
        saveContext()
    }
    
    func addBloodExam(bloodExam : BloodExamModel){
        let newExame = BloodExam(context: context)
        let pacientSaved = PacientModel(context: context)
        let toxoPlasm = ToxoplasmosisModel(context: context)
        let urea = Urea(context: context)
        
        //Assign individual values to the class urea
        urea.dL = bloodExam.urea.dL
        urea.mg = Int64(bloodExam.urea.mg)
        
        //Assign individual values to the class toxoplasmosis
        toxoPlasm.igg = bloodExam.toxoplasmosis.igg
        toxoPlasm.igm = bloodExam.toxoplasmosis.igm
        
        //Assign the fields without relationChip
        newExame.bloodType = bloodExam.bloodType.rawValue
        newExame.creatine = bloodExam.creatine
        newExame.hiv = bloodExam.hiv
        newExame.vdrlExam = bloodExam.vdrl.rawValue
        newExame.syphilis = bloodExam.syphilis
        newExame.tci = bloodExam.tci
        newExame.tcd = bloodExam.tcd
        newExame.ht = bloodExam.ht
        newExame.hb = bloodExam.hb
        newExame.whiteCells = Int64(bloodExam.whiteCells)
        newExame.platelets = Int64(bloodExam.platelets)
        newExame.glucose = Int64(bloodExam.glucose)
        newExame.hepatiteB = bloodExam.hepatiteB
        
        //Assign the relationChip of each class
        newExame.toxoplasmosis = toxoPlasm
        
        newExame.urea = urea
        
        newExame.pacient = pacientSaved
        
        //Add the current exam to pacient set of exams
        pacientSaved.bloodExam = NSSet(object: newExame)
        
        saveContext()
    }
    
    func addUltraSoundExam(ultraSound : UltrasoundExam){
        let savedPacient = PacientModel(context: context)
        let ultraSoundModel = UltraSoundModel(context: context)
        let  idadeGestacional = Idadegestacional(context: context)
        
        //Assign individual values do idadeGestacional
        idadeGestacional.dias = Int64(ultraSound.ig.dias)
        idadeGestacional.semana = Int64(ultraSound.ig.semanas)
        
        //Assign the fields without relationChip
        ultraSoundModel.weight = ultraSound.weight
        ultraSoundModel.placenta = ultraSound.placenta.rawValue
        ultraSoundModel.fetalPosition = ultraSound.fetalPosition.rawValue
        
        //Assign the relationChip of each class
        ultraSoundModel.idadeGestacional = idadeGestacional
               
        savedPacient.ultrassound = NSSet(object: ultraSoundModel)
        
        saveContext()
    }
    
    func assignPersonalBG(personalBG : PersonalBG){
        let personal = PersonalBackGround(context: context)
        let savedPacient = PacientModel(context: context)
        
        personal.diabetes = personalBG.diabetes
        personal.tabagism = personalBG.tabagism
        personal.hypertension = personalBG.hypertension
        personal.heartCondition = personalBG.heartCondition
        personal.urinaryInfection = personalBG.urinaryInfection
        
        //TODO
        
        //Adicionar o campo other
//        personal.other = personalBG.other
        
        //Adding the relationChip
        savedPacient.personalBG = personal
        
        saveContext()
    }
    
    func assignFamilylBG(familyBG : FamilyBG){
        let family = FamilyBackGround(context: context)
        let savedPacient = PacientModel(context: context)
        
        family.diabetes = family.diabetes
        family.tabagism = family.tabagism
        family.hypertension = family.hypertension
        family.heartCondition = family.heartCondition
        family.urinaryInfection = family.urinaryInfection
        
        //TODO
        
        //Adicionar o campo other
//        personal.other = personalBG.other
        
        //Adding the relationChip
        savedPacient.familyBG = family
        
        saveContext()
    }
}
