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
    
    static var currentConsult: Int64?
    static var currentDate: Date?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupview()
    }
    
    func setupview(){
        
        label.setupLabel(labelText: "\(HeaderForHistory.currentConsult ?? 2)° Consulta", labelType: .bigTitle, labelColor: .darkPink)
        self.addSubview(label)
        label.anchorWithMultiplayerValues(top: self.topAnchor, left: self.leadingAnchor, topPadding: screenSize.height * 0.002 ,leftPadding: screenSize.width * 0.005)
  
        let dataFormated = DateFormatter()
        dataFormated.dateFormat = "dd/MM/yy"
        let date = dataFormated.string(from: HeaderForHistory.currentDate!)
        data.setupLabel(labelText: "\(date)", labelType: .inputLabel, labelColor: .wierdGray)
        self.addSubview(data)
        data.anchorWithMultiplayerValues(top: label.bottomAnchor, left: self.leadingAnchor, leftPadding: screenSize.width * 0.005)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


