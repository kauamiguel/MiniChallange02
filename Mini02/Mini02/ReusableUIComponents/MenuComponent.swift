//
//  Menu.swift
//  Mini02
//
//  Created by Gabriel Eirado on 06/10/23.
//

import UIKit

class MenuComponent: UIButton {

    var selectedOption: String?


    func setupButton(options: [String]) {
        self.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1.00)
        self.showsMenuAsPrimaryAction = true
        self.layer.cornerRadius = 10

        var menuActions: [UIAction] = []

        for title in options {
            let action = UIAction(title: title, handler: { [weak self] action in
                self?.handleActionSelected(title: title)
            })
            menuActions.append(action)
        }

        self.menu = UIMenu(children: menuActions)
    }

    func handleActionSelected(title: String) {
        self.setTitle(title, for: .normal)
        self.selectedOption = title
    }

}
