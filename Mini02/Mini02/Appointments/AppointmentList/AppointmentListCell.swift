//
//  AppointmentListCell.swift
//  Mini02
//
//  Created by Daniel Ishida on 18/09/23.
//

import UIKit

class AppointmentListCell: UITableViewCell {
    
    //CELL IDENTIFIER
    static let identifier = "AppointmentListCell"
    
    //CELL ATTRIBUTES
    private let titleLabel: UILabel = {
        let title = LabelComponentView()
        
        title.textColor = UIColor.darkPink()
        title.textAlignment = .left
        title.font = UIFont(name: "Signika-Regular", size: 24)
      
        
        return title
    }()
    
    private let dateLabel: UILabel = {
        let date = UILabel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        
        date.textColor = UIColor.wierdGray()
        date.textAlignment = .left
        date.font = UIFont(name: "Signika-Regular", size: 16)
     
      
        return date
    }()
    
    func setupUI(){
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.dateLabel)
        
        
       
        titleLabel.anchorWithConstantValues(
            top: self.topAnchor,
            left: self.leadingAnchor,
            bottom: self.bottomAnchor,
            leftPadding: 30
        )
        
        dateLabel.anchorWithConstantValues(
            top: self.topAnchor,
            right: self.trailingAnchor,
            bottom: self.bottomAnchor,
            rightPadding: -30
        )
        
        
    }
    
    func configure(with consultaData: ConsultEntity) {
        titleLabel.text = "\(consultaData.consultId)° Consulta"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        dateLabel.text = dateFormatter.string(from: consultaData.date!)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

