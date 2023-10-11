//
//  CheckboxManager.swift
//  Mini02
//
//  Created by Fabio Freitas on 11/10/23.
//

import UIKit

class CheckBoxManager {
    var buttons = [UIButton]()
    var active: UIButton?
    
    func uncheckEveryExcept(e: UIButton) {
        active = e
        for btn in buttons {
            if let red = btn as? CheckBoxComponentRedView, red != e {
                red.checked = false
            }
            if let green = btn as? CheckBoxComponentGreenView, green != e {
                green.checked = false
            }
        }
    }
}
