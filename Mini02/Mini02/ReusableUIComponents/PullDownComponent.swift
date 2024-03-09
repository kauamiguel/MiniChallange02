//
//  Menu.swift
//  Mini02
//
//  Created by Gabriel Eirado on 06/10/23.
//

import UIKit

import UIKit

class PullDownComponent: UIButton {
    
    var selectedOption: String = ""{
        didSet{
            self.setTitle(self.selectedOption, for: .normal)
        }
    }

    func setupButton(options: [String]) {
        self.backgroundColor = UIColor.lightPink()
        self.showsMenuAsPrimaryAction = true
        self.layer.cornerRadius = 6
        self.titleLabel?.font = UIFont(name: "Signika-Regular", size: 16)
        var menuActions: [UIAction] = []
       
      
        
        
        for title in options {
            let action = UIAction(title: title, handler: { [weak self] action in
                self?.handleActionSelected(title: title)
            })
            menuActions.append(action)
        }
        
        self.menu = UIMenu(children: menuActions)
       
        var chevronImageView = UIImageView()
        
        let chevronImage = UIImage(systemName: "chevron.up.chevron.down")
        chevronImageView = UIImageView(image: chevronImage)
        chevronImageView.tintColor = UIColor.darkPink()
   
        self.addSubview(chevronImageView)
        chevronImageView.anchorWithConstantValues(right: self.trailingAnchor, rightPadding: -UIScreen.main.bounds.width * 0.03)
        chevronImageView.centerY(inView: self)
          
    }
    
    func handleActionSelected(title: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.darkPink(), for: .normal)
        self.titleLabel?.font = UIFont(name: "Signika-Regular", size: 16)
        self.selectedOption = title
    }
}
