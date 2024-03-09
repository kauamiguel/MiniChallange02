//
//  CustomSeparator.swift
//  Mini02
//
//  Created by Gabriel Eirado on 06/10/23.
//

import UIKit

enum SeparatorWidth {
    case internVertical
    case internHorizontal
    case extern
    
    var value: CGFloat {
        switch self {
        case .internVertical: return 1
        case .internHorizontal: return 2
        case .extern: return 2
        }
    }
}


class CustomSeparatorView: UIView {

    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.lilLessDarkPink()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}




