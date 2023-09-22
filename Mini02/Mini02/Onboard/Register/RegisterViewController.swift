//
//  RegisterViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerViewManager = RegisterView()  // need to refactor later
    let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        registerViewManager.setUpRegisterView(vc: self, action: #selector(nextTapped))
    }
    
    @objc func nextTapped() {
        self.registerViewModel.view = self
        self.registerViewModel.buttonFuncionality()
    }
}
