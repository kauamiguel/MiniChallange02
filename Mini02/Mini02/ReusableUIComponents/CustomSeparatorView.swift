//
//  CustomSeparator.swift
//  Mini02
//
//  Created by Gabriel Eirado on 06/10/23.
//

import UIKit

enum SeparatorWidth {
    case intern
    case extern
    
    var value: CGFloat {
        switch self {
        case .intern: return 0.1
        case .extern: return 0.2
        }
    }
}


class CustomSeparatorView: UIView {

    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1.00)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}




