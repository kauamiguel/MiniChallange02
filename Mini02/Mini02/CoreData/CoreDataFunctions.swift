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
              
            //Sort the consult based on treemester and consultId
            let comparator: (ConsultEntity, ConsultEntity) -> Bool = { consult1, consult2 in
                if consult1.tremesteer == consult2.tremesteer {
                    return consult1.consultId < consult2.consultId
                }
                return consult1.tremesteer < consult2.tremesteer
            }
            
            consultArray.sort(by: comparator)
            
            return consultArray
        }
        return []
    }
    
    //Delete a consult based on the treemester and the ID
    func deleteConsults(treemesterNumber : Int, consultID : Int) {
        
        fetchPacient()
        if let pacient = self.pacient{
            let consult = pacient.consults as! Set<ConsultEntity>
            var consultArray = Array(consult)
            consultArray.sort{$0.consultId < $1.consultId}
            
            for i in 0..<consultArray.count{
                if consultArray[i].tremesteer == treemesterNumber && consultArray[i].consultId == consultID{
                    consultArray.remove(at: i)
                    break
                }
            }
            
            //Assign the new Array of consults without the deleted element
            pacient.consults = NSSet(array: consultArray)
            saveContext()
            fetchPacient()
        }
    }
    
    //Function to fetch the pacient
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
    
    //Return the values of influenza vaccine
    func getInfluenza() -> DoseVaccines?{
        if let pacient = self.pacient{
            let date = pacient.vaccines?.influenza?.vaccineDate
            let isVaccined = pacient.vaccines?.influenza?.isVaccined
            let numberOfDose = pacient.vaccines?.influenza?.numberOfDose
            let dose = DoseVaccines(date: date ?? Date(), isVaccined: isVaccined ?? false, numberOfDose: Int(numberOfDose ?? 0))
            return dose
        }
        return nil
    }
    
    //Return the array with hepatite info
    func getHepatite() -> [VaccinesDoses]{
        
        fetchPacient()
        if let pacient = self.pacient{
            let hepatite = pacient.vaccines?.hepatiteB as! Set<VaccinesDoses>
            var hepatiteArray = Array(hepatite)
            hepatiteArray.sort{$0.numberOfDose < $1.numberOfDose}
            return hepatiteArray
        }
        return []
    }
    
    //Return the array with antitetanic info
    func getAntitetanic() -> [VaccinesDoses]{
        
        fetchPacient()
        if let pacient = self.pacient{
            let antitetanic = pacient.vaccines?.antitetanic as! Set<VaccinesDoses>
            var antitetanicArray = Array(antitetanic)
            antitetanicArray.sort{$0.numberOfDose < $1.numberOfDose}
            return antitetanicArray
        }
        return []
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
        //Assign a vaccines atribute to the pacient, then can add any kind of vaccine because its not empty
        self.pacient?.vaccines = VaccinesEntity(context: context)
    }
    
    //Add influenza vaccine
    func addVaccineInfluenza(dose : DoseVaccines){
        if let pacient = self.pacient{
            let dosesEntity = VaccinesDoses(context: context)
            dosesEntity.isVaccined = dose.isVaccined
            dosesEntity.vaccineDate = dose.date
            dosesEntity.numberOfDose = Int64(dose.numberOfDose)
            
            pacient.vaccines?.influenza = dosesEntity
            
            saveContext()
            fetchPacient()
        }
    }
    
    //Add a new hepatite Vaccine
    func addVaccineHepatite(dose : DoseVaccines){
        if let pacient = self.pacient{
            //Create a new instance to assign to the NSSet
            let dosesEntity = VaccinesDoses(context: context)
            dosesEntity.isVaccined = dose.isVaccined
            dosesEntity.vaccineDate = dose.date
            dosesEntity.numberOfDose = Int64(dose.numberOfDose)
            
            //Append the new element to the set
            let setHepatite = pacient.vaccines?.hepatiteB as! Set<VaccinesDoses>
            var arrayHepatite = Array(setHepatite)
            arrayHepatite.append(dosesEntity)
            
            //Assign the new Set with the last element to the vaccines hepatite Set
            self.pacient?.vaccines?.hepatiteB = NSSet(array: arrayHepatite)
            saveContext()
            fetchPacient()
        }
    }
    
    //Add a new antetanica Vaccine
    func addVaccineAntitetanic(dose : DoseVaccines){
        if let pacient = self.pacient{
            //Create a new instance to assign to the NSSet
            let dosesEntity = VaccinesDoses(context: context)
            dosesEntity.isVaccined = dose.isVaccined
            dosesEntity.vaccineDate = dose.date
            dosesEntity.numberOfDose = Int64(dose.numberOfDose)
            
            //Append the new element to the set
            let setAntitetanic = pacient.vaccines?.hepatiteB as! Set<VaccinesDoses>
            var arrayAntitetanic = Array(setAntitetanic)
            arrayAntitetanic.append(dosesEntity)
            
            //Assign the new Set with the last element to the vaccines hepatite Set
            self.pacient?.vaccines?.antitetanic = NSSet(array: arrayAntitetanic)
            saveContext()
            fetchPacient()
        }
    }
    
    //Add personal info to a pacient that alredy exists
    func addPersonalInfo(firstName : String, secondName : String, nickName : String, dateOfBirth : Date, height : Float , weight : Float){
        
        
        //Create a pacient first to assign the atributes
        //This function will be executed in the first launch of the app
        createPacient()
        
        if let pacient = self.pacient{
            pacient.nickName = nickName
            pacient.dateOfBirth = dateOfBirth
            pacient.firstName = firstName
            pacient.secondName = secondName
            pacient.height = height
            pacient.weight = weight
            self.pacient = pacient
            
            saveContext()
            fetchPacient()
        }
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
        newExame.ht = bloodExam.ht
        newExame.hb = bloodExam.hb
        newExame.whiteCells = Int64(bloodExam.whiteCells)
        newExame.platelets = Int64(bloodExam.platelets)
        newExame.glucose = Int64(bloodExam.glucose)
        newExame.consultNumber = Int64(bloodExam.consultNumber)
        
        //Assign the relationChip of each class
        newExame.toxoplasmosis = toxoPlasm
        newExame.urea = urea
        
        return newExame
    }
    
    //Add all information about ultraSound exam
    func addUltraSoundExam(ultraSound : UltrasoundExam) -> UltraSoundModel{
        let ultraSoundModel = UltraSoundModel(context: context)
        let idadeGestacional = Idadegestacional(context: context)
        
        //Assign individual values do idadeGestacional
        idadeGestacional.dias = Int64(ultraSound.ig.dias)
        idadeGestacional.semana = Int64(ultraSound.ig.semanas)
        
        //Assign the fields without relationChip
        ultraSoundModel.weight = ultraSound.weight
        ultraSoundModel.placenta = ultraSound.placenta.rawValue
        ultraSoundModel.fetalPosition = ultraSound.fetalPosition.rawValue
        ultraSoundModel.consultNumber = Int64(ultraSound.consultNumber)
        ultraSoundModel.date = ultraSound.date
        ultraSoundModel.gestacionalAge = Int64(ultraSound.gestacionalAge)
        ultraSoundModel.ila = Int64(ultraSound.ILA)
        
        //Assign the relationChip of each class
        ultraSoundModel.idadeGestacional = idadeGestacional
        
        return ultraSoundModel
    }
    
    //Add exams to a consult (Blood and ultrasound)
    func addNewConsult(newConsult : Consulta){
        let pacient = self.pacient
        let consult = ConsultEntity(context: context)
        
        //Create a routineData to assing to this consult
        if let newroutine = newConsult.routineData{
            let routine = RoutineData(context: context)
            routine.bloodPressureInmmHG = newroutine.bloodPressure
            routine.edema = newroutine.edema
            routine.fetalHeartRate = Int64(newroutine.fetalHeartHate)
            routine.uterineHeightInCentimeters = Int64(newroutine.uterineHeight)
            routine.weightAndBodyMassIndex = Float(newroutine.uterineHeight)
            routine.ig = Int64(newroutine.ig)
            consult.routineData = routine
        }
        
        //Assing some atributes to the consult owner
        consult.tremesteer = Int64(newConsult.trimesteer)
        consult.date = newConsult.date
        consult.consultId = Int64(newConsult.consultId)

        
        //Add a blood exam if it has
        if let blood = newConsult.bloodExams{
            
            let newBloodExam = addBloodExam(bloodExam: blood)
            
            //Add the id of the consult to the id of the bloodExam
            newBloodExam.consultNumber = Int64(consult.consultId)
            
            consult.bloodExam = newBloodExam
        }
        
        //Add a ultrasound if it has
        if let ultra = newConsult.ultraSoundExams{
            
            let newUltrasound = addUltraSoundExam(ultraSound: ultra)
            
            //Add the id of the consult to the id of the bloodExam
            newUltrasound.consultNumber = Int64(consult.consultId)
            
            consult.ultraSound = newUltrasound
        }
        
        if let dueDate = newConsult.dueDate{
            let due = DueDate(context: context)
            due.estimatedDueDate = newConsult.dueDate?.estimatedDueDate
            due.estimatedDueDateEco = newConsult.dueDate?.estimatedDueDateEco
            consult.dueDate = due
        }
        
        if let plannedPregnancy = newConsult.plannedPregnancy{
            let planned = PregnancyPlanning(context: context)
            planned.plannedPregnancy = plannedPregnancy.plannedPregnancy
            consult.pregnancyPlanning = planned
        }
        
        if let riskPregnancy = newConsult.riskPregnancy{
            var risk = PregnancyRisk(context: context)
            risk.highRiskPregnancy = (riskPregnancy.highRiskPregnancy)
            risk.lowRiskPregnancy = (riskPregnancy.lowRiskPregnancy)
            consult.pregnancyRisk = risk
        }
        
        if let pregnancyClassificationModel = newConsult.pregnancyClassificationModel{
            let classification = PregnancyClassification(context: context)
            classification.singlePregnancy = pregnancyClassificationModel.singlePregnancy
            
            classification.tripletsOrMorePregnancy = pregnancyClassificationModel.tripletsOrMorePregnancy
            
            classification.twinPregnancy = pregnancyClassificationModel.twinPregnancy
            
            consult.pregnancyClassification = classification
        }
        
        //Assing the new Consult to current pacient
        pacient?.mutableSetValue(forKey: "consults").add(consult)
        
        saveContext()
        fetchPacient()
        self.checkFirstAppointment()
    }
    
    private func checkFirstAppointment() {
        if ApplicationSettings.shouldEnterFirstAppointment() {
            ApplicationSettings.hasEnteredFirstAppointment()
        }
    }
    
    
    func assignPersonalBG(personalBG : PersonalBGModel){
        let personalBackGround = PersonalBackGround(context: context)
        let savedPacient = self.pacient
        
        personalBackGround.diabetes = personalBG.diabetes
        personalBackGround.tabagism = personalBG.tabagism
        personalBackGround.hypertension = personalBG.hypertension
        personalBackGround.heartCondition = personalBG.heartCondition
        personalBackGround.urinaryInfection = personalBG.urinaryInfection

        //Adding the relationChip
        savedPacient?.personalBG = personalBackGround
        saveContext()
        fetchPacient()
    }
    
    func assignFamilylBG(familyBG : FamilyBGModel){
        let family = FamilyBackGround(context: context)
        let savedPacient = pacient
        
        family.diabetes = familyBG.diabetes
        family.hypertension = familyBG.hypertension
        family.heartCondition = familyBG.heartCondition
        family.urinaryInfection = familyBG.urinaryInfection
        
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
