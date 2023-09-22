//
//  CheckBoxComponentRed.swift
//  Mini02
//
//  Created by Gabriel Eirado on 22/09/23.
//

import Foundation
import UIKit


class CheckBoxComponentRed: UIButton {

    private var image: UIImage{
        return checked ? UIImage(named: "checkBoxRed")! :  UIImage(named: "Property 1=Default")!
    }
    
    var checked: Bool = false{
        didSet {
            self.imageView?.image = image
        }
    }
    
    func setupButton(){
        backgroundColor = .clear
        layoutSubviews()
        self.addTarget(self, action: #selector(buttonfunc), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setImage(image, for: .normal)
    }

    @objc func buttonfunc() {
        checked = !checked
    }
    
    func getBoolleanValue() -> Bool{
        return checked
    }
}
