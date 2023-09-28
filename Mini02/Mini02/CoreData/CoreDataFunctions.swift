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
    
    var pacient  : Pacient?
    
    func saveContext() {
        do{
            try context.save()
            fetchPacient()
        }catch{
            print("Error saving the context")
        }
    }
    
    func getBloodExam() -> [BloodExam]{
        
        fetchPacient()
        if let pacient = self.pacient{
            let examset = pacient.bloodExam as! Set<BloodExam>
            var examArray = Array(examset)
            examArray.sort{$0.consultNumber < $1.consultNumber}
            return examArray
        }
        return []
    }
    
    func getBloodUltraSoundExam() -> [UltraSoundModel]{
        
        fetchPacient()
        if let pacient = self.pacient{
            let examset = pacient.bloodExam as! Set<UltraSoundModel>
            var examArray = Array(examset)
            examArray.sort{$0.consultNumber < $1.consultNumber}
            return examArray
        }
        return []
    }
    
    func fetchPacient(){
        do{
            let pacientArray = try context.fetch(Pacient.fetchRequest())
            
            if let pacientFirst = pacientArray.first{
                self.pacient = pacientFirst
            }
            
        }catch{
            print("Error fetching of the pacient")
        }
    }
    
    //Create a pacient for the first time
    func createPacient(){
        self.pacient = Pacient(context: context)
    }
    
    //Add personal info to a pacient that alredy exists
    func addPersonalInfo(firstName : String, secondName : String, nickName : String, age : Int, height : Float , weight : Float){
        
        createPacient()
        if let pacient = self.pacient{
            pacient.nickName = nickName
            pacient.age = Int64(age)
            pacient.firstName = firstName
            pacient.secondName = secondName
            pacient.height = height
            pacient.weight = weight
            self.pacient = pacient
        }
        saveContext()
        fetchPacient()
    }
    
    //Add all information about blood exam
    func addBloodExam(bloodExam : BloodExamModel){
        let newExame = BloodExam(context: context)
        let pacientSaved = pacient
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
        newExame.consultNumber = Int64(bloodExam.consultNumber)
        
        //Assign the relationChip of each class
        newExame.toxoplasmosis = toxoPlasm
        newExame.urea = urea
        newExame.pacient = pacientSaved
        
        //Add the current exam to pacient set of exams
        let examset = pacient!.bloodExam as! Set<BloodExam>
        var examArray = Array(examset)
        examArray.append(newExame)
        pacientSaved!.bloodExam = NSSet(array: examArray)
        
        saveContext()
        fetchPacient()
    }
    
    //Add all information about ultraSound exam
    func addUltraSoundExam(ultraSound : UltrasoundExam){
        let pacientSaved = pacient
        let ultraSoundModel = UltraSoundModel(context: context)
        let  idadeGestacional = Idadegestacional(context: context)
        
        //Assign individual values do idadeGestacional
        idadeGestacional.dias = Int64(ultraSound.ig.dias)
        idadeGestacional.semana = Int64(ultraSound.ig.semanas)
        
        //Assign the fields without relationChip
        ultraSoundModel.weight = ultraSound.weight
        ultraSoundModel.placenta = ultraSound.placenta.rawValue
        ultraSoundModel.fetalPosition = ultraSound.fetalPosition.rawValue
        ultraSoundModel.consultNumber = Int64(ultraSound.consultNumber)
        
        //Assign the relationChip of each class
        ultraSoundModel.idadeGestacional = idadeGestacional
        
        //Add the new Ultrassound exam into the set of ultraSounds
        let examset = pacient!.bloodExam as! Set<UltraSoundModel>
        var examArray = Array(examset)
        examArray.append(ultraSoundModel)
        pacientSaved!.bloodExam = NSSet(array: examArray)
        
        saveContext()
        fetchPacient()
    }
    
    func assignPersonalBG(personalBG : PersonalBGModel){
        let personalBackGround = PersonalBackGround(context: context)
        let savedPacient = pacient
        
        personalBackGround.diabetes = personalBG.diabetes
        personalBackGround.tabagism = personalBG.tabagism
        personalBackGround.hypertension = personalBG.hypertension
        personalBackGround.heartCondition = personalBG.heartCondition
        personalBackGround.urinaryInfection = personalBG.urinaryInfection
        
        //TODO
        //Adicionar o campo other
        //        personal.other = personalBG.other
        
        
        //Adding the relationChip
        savedPacient?.personalBG = personalBackGround
        saveContext()
        fetchPacient()
    }
    
    func assignFamilylBG(familyBG : FamilyBGModel){
        let family = FamilyBackGround(context: context)
        let savedPacient = pacient
        
        family.diabetes = family.diabetes
        family.tabagism = family.tabagism
        family.hypertension = family.hypertension
        family.heartCondition = family.heartCondition
        family.urinaryInfection = family.urinaryInfection
        
        //TODO
        //Adicionar o campo other
        //        personal.other = personalBG.other
        
        
        //Adding the relationChip
        savedPacient!.familyBG = family
        
        saveContext()
        fetchPacient()
    }
}
