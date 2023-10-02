//
//  TabBarView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import Foundation
import UIKit

class TabBarView: UIView {  // everything that is UI
    func setUpTabBarView(tb: TabBarViewController){
        
        tb.tabBar.unselectedItemTintColor = UIColor(red: 0.227, green: 0.651, blue: 0.725, alpha: 0.5)
        tb.tabBar.tintColor =  UIColor(red: 0.227, green: 0.651, blue: 0.725, alpha: 1)
        tb.tabBar.backgroundColor = UIColor(red: 1, green: 0.933, blue: 0.933, alpha: 1)
        
//        tb.tabBar.anchorWithConstantValues(height: )
        
        tb.tabBar.layer.borderWidth = 2.0
        tb.tabBar.layer.borderColor = UIColor(red: 1, green: 0.521, blue: 0.58, alpha: 0.5).cgColor
        
    }
}
