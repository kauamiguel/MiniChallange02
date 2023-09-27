//
//  ProfileViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class ProfileViewController: UIViewController {
    var viewModel: ProfileViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ProfileViewModel()
        
        let profileView = ProfileView()
        profileView.setupProfile(vc: self)
    }
}

