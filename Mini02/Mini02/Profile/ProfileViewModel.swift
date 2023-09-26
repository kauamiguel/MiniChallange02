//
//  ProfileViewModel.swift
//  Mini02
//
//  Created by Fabio Freitas on 26/09/23.
//

import Foundation
import UIKit

class ProfileViewModel {
    struct LinkHelper {
        let name: String
        var isModal: Bool = false
        let vc: UIViewController
    }
    
    let links: [LinkHelper] = [
        .init(name: "Dados", vc: PregnantDataViewController()),
        .init(name: "Sobre o projeto", isModal: true, vc: AboutViewController())
    ]
}



