//
//  PregnantDataViewModel.swift
//  Mini02
//
//  Created by Fabio Freitas on 28/09/23.
//

import Foundation
import UIKit

class PregnantDataViewModel {
    var viewController: UIViewController?
    
    struct ProfileData {
        let name: String
        let nickname: String
        let dateOfBirth: Date
        let emergencyContact: EmergencyContactModel
    }
    private var profileData: ProfileData?
    
    func getPatientData() -> Pacient? {
        let coreData = CoreDataFunctions()
        coreData.fetchPacient()
        return coreData.pacient
    }
    
    func profileDataIsValid(
        name: String?,
        nickname: String?,
        dateOfBirth: Date,
        emergencyContactName: String?,
        emergencyContactPhone: String?,
        emergencyContactRelation: String?
    ) -> Bool {
        
        guard let name, !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        guard let nickname, !nickname.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        guard let contactName = emergencyContactName, !contactName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        guard let contactPhone = emergencyContactPhone, !contactPhone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        guard let contactRelation = emergencyContactRelation, !contactRelation.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        self.profileData = ProfileData(name: name, nickname: nickname, dateOfBirth: dateOfBirth, emergencyContact: EmergencyContactModel(name: contactName, phone: contactPhone, relation: EmergencyContactRelation(rawValue: contactRelation) ?? .other) )
        return true
    }
    
    func saveProfileData() {
        guard let profileData else { return }
        
        let coreData = CoreDataFunctions()
        coreData.fetchPacient()
        coreData.addPersonalInfo(firstName: profileData.name, secondName: "", nickName: profileData.nickname, dateOfBirth: profileData.dateOfBirth, height: 0, weight: 0)
        coreData.assignEmergencyContact(contact: profileData.emergencyContact)
        coreData.saveContext()
        coreData.fetchPacient()
    }
    
    
    func didTapTempSaveButton(
        nameText: String?,
        nicknameText: String?,
        dateOfBirth: Date,
        contactNameText: String?,
        contactPhoneText: String?,
        contactRelation: String?
    ) {
        let alert = UIAlertController(title: "Dados Inválidos", message: "Verifique se todos os campos estão preenchidos e tente novamente", preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        let haptics = UINotificationFeedbackGenerator()
        let profileDataIsValid = self.profileDataIsValid(name: nameText, nickname: nicknameText, dateOfBirth: dateOfBirth, emergencyContactName: contactNameText, emergencyContactPhone: contactPhoneText, emergencyContactRelation: contactRelation)
        guard profileDataIsValid else {
            self.viewController?.present(alert, animated: true)
            haptics.notificationOccurred(.error)
            return
        }
        self.saveProfileData()
        alert.title = "Sucesso!"
        alert.message = "Seu perfil foi atualizado com sucesso!"
        haptics.notificationOccurred(.success)
        self.viewController?.present(alert, animated: true)
    }
    
    @objc func didTapInfoButton() {
        viewController?.present(AboutViewController(), animated: true)
    }
    
}
