//
//  Menu.swift
//  Mini02
//
//  Created by Gabriel Eirado on 06/10/23.
//

import Foundation
import UIKit

class Menu: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    func setupButton(){
        
        self.backgroundColor = .red
        self.setTitle("Edit", for: .normal)
        self.showsMenuAsPrimaryAction = true
        
        self.menu = UIMenu(children: [
            UIAction(title: "Select Messages", handler: { action in
                print("Select Messages")
            }),
            UIAction(title: "Edit Pins", handler: { action in
                print("Edit Pins")
            }),
            UIAction(title: "Edit Name and Photo", handler: { action in
                print("Edit Name and Photo")
            })
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
