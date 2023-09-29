//
//  RegisterViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()  // need to refactor later
    let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerViewModel.viewController = self
        registerView.setUpRegisterView(vc: self, vm: registerViewModel)
    }
    
    
}
