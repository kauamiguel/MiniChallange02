//
//  RegisterViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import UIKit

//protocol RegisterViewDelegate: AnyObject {
//    func nextButtonTapped(vc : RegisterViewController)
//}

class RegisterViewController: UIViewController {
    
    let registerViewManager = RegisterView()  // need to refactor later
    let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        registerViewManager.setUpRegisterView(vc: self, action: #selector(nextButtonTapped))
    }
    
    @objc func nextButtonTapped() {
        self.registerViewModel.view = self
        self.registerViewModel.buttonFuncionality()
    }
}
