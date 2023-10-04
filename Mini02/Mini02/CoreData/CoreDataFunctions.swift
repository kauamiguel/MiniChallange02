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
        guard context.hasChanges else { return }
        
        do{
            try context.save()
            fetchPacient()
        }catch{
            print("Error saving the context")
        }
    }
    
    //Return na array of consults exam to manipulate in other views
    func getConsults() -> [ConsultEntity]{
        
        fetchPacient()
        if let pacient = self.pacient{
            let consult = pacient.consults as! Set<ConsultEntity>
            var consultArray = Array(consult)
            consultArray.sort{$0.consultId < $1.consultId}
            return consultArray
        }
        return []
    }
    
    func fetchPacient(){
        do{
            let patientFetchRequest = Pacient.fetchRequest()
            let pacientArray = try context.fetch(patientFetchRequest)
            
            if let pacientFirst = pacientArray.first{
                self.pacient = pacientFirst
            }
            
        }catch{
            print("Error fetching of the pacient")
        }
    }
    
    func resetPatient() {
        if let pacient {
            context.delete(pacient)
        }
        saveContext()
    }
    
    //Create a pacient for the first time
    func createPacient(){
        guard pacient == nil else { return }
        self.pacient = Pacient(context: context)
    }
    
    //Add influenza vaccine
    func addVaccineInfluenza(influenza : DoseVaccines){
        let vaccineEntity = VaccinesEntity(context: context)
        let doseEntity = VaccinesDoses(context: context)
        let pacient = self.pacient
        
        doseEntity.isVaccined = influenza.isVaccined
        doseEntity.vaccineDate = influenza.date
        doseEntity.numberOfDose = Int64(influenza.numberOfDose)
        
        vaccineEntity.influenza = doseEntity
        pacient?.vaccines = vaccineEntity
    
        saveContext()
        fetchPacient()
    }
    
    //Add personal info to a pacient that alredy exists
    func addPersonalInfo(firstName : String, secondName : String, nickName : String, dateOfBirth : Date, height : Float , weight : Float){
        
        createPacient()
        if let pacient = self.pacient{
            pacient.nickName = nickName
            pacient.dateOfBirth = dateOfBirth
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
    func addBloodExam(bloodExam : BloodExamModel) -> BloodExam{
        let newExame = BloodExam(entity: BloodExam.entity(), insertInto: context)
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
        
        return newExame
    }
    
    //Add all information about ultraSound exam
    func addUltraSoundExam(ultraSound : UltrasoundExam) -> UltraSoundModel{
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
        
        return ultraSoundModel
    }
    
    //Add exams to a consult (Blood and ultrasound)
    func addNewConsult(newConsult : Consulta){
        let pacient = self.pacient
        let consult = ConsultEntity(context: context)
        
        //Add a blood exam if it has
        if let blood = newConsult.bloodExams{
            
            let newBloodExam = addBloodExam(bloodExam: blood)
            
            //Add the id of the consult to the id of the bloodExam
            newBloodExam.consultNumber = Int64(newConsult.consultId)
            
            consult.bloodExam = newBloodExam
        }
        
        //Add a ultrasound if it has
        if let ultra = newConsult.ultraSoundExams{

            let newUltrasound = addUltraSoundExam(ultraSound: ultra)
            
            //Add the id of the consult to the id of the bloodExam
            newUltrasound.consultNumber = Int64(newConsult.consultId)
            
            consult.ultraSound = newUltrasound
        }
        
        //Assing the new Consult to current pacient
        pacient?.mutableSetValue(forKey: "consults").add(consult)
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
    
    func assignEmergencyContact(contact: EmergencyContactModel) {
        fetchPacient()
        guard let pacient else { return }
        
        let emergencyContact = EmergencyContact(context: context)
        
        emergencyContact.name = contact.name
        emergencyContact.phone = contact.phone
        emergencyContact.relation = contact.relation.rawValue
        pacient.emergencyContact = emergencyContact
        
        saveContext()
        fetchPacient()
    }
}
