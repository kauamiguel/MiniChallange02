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
        
        tb.tabBar.unselectedItemTintColor = UIColor.darkPink()
        tb.tabBar.tintColor = UIColor.darkPink()
        tb.tabBar.backgroundColor = UIColor(red: 1, green: 0.933, blue: 0.933, alpha: 1)
        let appearance = UITabBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = UIColor(red: 1, green: 0.933, blue: 0.933, alpha: 1)
        tb.tabBar.scrollEdgeAppearance = appearance
        tb.tabBar.standardAppearance = appearance
        
        tb.tabBar.layer.borderWidth = 2.0
        tb.tabBar.layer.borderColor = UIColor(red: 1, green: 0.521, blue: 0.58, alpha: 0.5).cgColor
        
    }
}
