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

        tb.tabBar.tintColor = .label
        tb.tabBar.backgroundColor = .systemGray6
    }
}
