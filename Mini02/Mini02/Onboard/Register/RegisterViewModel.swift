//
//  RegisterViewModel.swift
//  Mini02
//
//  Created by Kaua Miguel on 21/09/23.
//

import UIKit


class RegisterViewModel{
    var view: UIViewController?
    
    func buttonFuncionality(){
        let tabBarViewController = TabBarViewController()
        tabBarViewController.modalPresentationStyle = .fullScreen
//        self.view?.present(tabBarViewController, animated: true)
        let vc = TabBarViewController()
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
}
