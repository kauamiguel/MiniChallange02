//
//  RegisterViewModel.swift
//  Mini02
//
//  Created by Kaua Miguel on 21/09/23.
//

import UIKit


class RegisterViewModel{
    var viewController: UIViewController?
    
    struct OnboardingPatientData {
        let name: String
        let alias: String
        let dateOfBirth: Date
    }
    var initialData: OnboardingPatientData? = nil
    
    func sendToMainView(){
        ApplicationSettings.hideOnboardingOnStart()
        let tabBarViewController = TabBarViewController()
        tabBarViewController.modalPresentationStyle = .fullScreen
        self.viewController?.present(tabBarViewController, animated: true)
    }
    
    func dataIsValid(name: String?, alias: String?, dateOfBirth: Date?) -> Bool {
        guard let name, !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }
        guard let alias, !alias.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }
        guard let dateOfBirth else { return false }
        self.initialData = OnboardingPatientData(name: name, alias: alias, dateOfBirth: dateOfBirth)
        return true
    }
    
    func saveInitialData() {
        guard let initialData else { return }
        let coreData = CoreDataFunctions()
        
        coreData.addPersonalInfo(firstName: initialData.name, secondName: "", nickName: initialData.alias, dateOfBirth: initialData.dateOfBirth, height: 0, weight: 0)
    }
    
    func didTapNext(
        nameText: String?,
        nicknameText: String?,
        dateOfBirth: Date
    ) {
        let haptics = UINotificationFeedbackGenerator()
        let isValid = self.dataIsValid(name: nameText, alias: nicknameText, dateOfBirth: dateOfBirth)
        guard isValid else {
            let alert = UIAlertController(title: "Dados Inválidos", message: "Preencha os dados para continuar", preferredStyle: .alert)
            alert.addAction(.init(title: "Ok", style: .default))
            haptics.notificationOccurred(.error)
            viewController?.present(alert, animated: true)
            return
        }
        self.saveInitialData()
        haptics.notificationOccurred(.success)
        self.sendToMainView()
    }
}
