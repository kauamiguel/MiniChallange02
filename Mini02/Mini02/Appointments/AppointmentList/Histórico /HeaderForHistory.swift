//
//  HeaderForHistory.swift
//  Mini02
//
//  Created by Gabriel Eirado on 11/10/23.
//
import UIKit

class HeaderForHistory: UICollectionReusableView {
    
    static let id = "HeaderCell"
    let screenSize = UIScreen.main.bounds.size

    let label = LabelComponentView()
    let data = LabelComponentView()
    
    var currentConsult: Int64?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupview()
    }
    
    func setupview(){
        
        label.setupLabel(labelText: "Consulta \(currentConsult ?? 2)", labelType: .titleBold, labelColor: .secondaryColor)
        self.addSubview(label)
        label.anchorWithMultiplayerValues(top: self.topAnchor, left: self.leadingAnchor, topPadding: screenSize.height * 0.003 ,leftPadding: screenSize.width * 0.005)
        
        data.setupLabel(labelText: "\("data")", labelType: .inputLabel, labelColor: .secondaryText)
        self.addSubview(data)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


