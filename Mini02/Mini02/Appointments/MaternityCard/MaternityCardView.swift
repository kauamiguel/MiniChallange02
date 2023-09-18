//
//  AntenatalViewModel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardView: UICollectionViewCell {

    private var vm =  ProfileView()
    
    static let identifier = "default"
    
    func setUpCell(){
        self.backgroundColor = .purple
        
        
    }
    
    func configure(with view: UIView){
        setUpCell()
     
    }
    
}
