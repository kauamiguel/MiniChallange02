//
//  Localized .swift
//  Mini02
//
//  Created by Kaua Miguel on 16/10/23.
//

import Foundation


extension String{
    func localized() -> String{
        return NSLocalizedString(self,tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
