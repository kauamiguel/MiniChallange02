//
//  TextField.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import Foundation
import UIKit



extension UITextField{
    
    func textField(withPlaceholder placeHolder: String, size: CGFloat) -> UITextField{
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: size)
        tf.backgroundColor = .red
        tf.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return tf
    }
}
