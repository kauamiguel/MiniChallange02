//
//  CheckBoxComponent.swift
//  Mini02
//
//  Created by Gabriel Eirado on 21/09/23.
//

import Foundation
import UIKit

class CheckBoxComponentGreenView: UIButton {
    weak var manager: CheckBoxManager?

    private var imageCheck: UIImage {
        return checked ? UIImage(named: "Property 1=Variant2")?.withRenderingMode(.alwaysOriginal) ?? UIImage() : UIImage(named: "Property 1=Default")?.withRenderingMode(.alwaysOriginal) ?? UIImage()
    }

    var checked: Bool = false {
        didSet {
            self.setImage(imageCheck, for: .normal)
            if checked {
                manager?.uncheckEveryExcept(e: self)
            }
        }
    }

    func setupButton() {
        backgroundColor = .clear
        manager?.buttons.append(self)
        self.addTarget(self, action: #selector(buttonFunc), for: .touchUpInside)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.setImage(imageCheck, for: .normal)
        
        // Set the frame of the image view to match the button's bounds
        self.imageView?.frame = self.bounds

    }

    @objc func buttonFunc() {
        checked = !checked
    }

    func getBooleanValue() -> Bool {
        return checked
    }
    

}
