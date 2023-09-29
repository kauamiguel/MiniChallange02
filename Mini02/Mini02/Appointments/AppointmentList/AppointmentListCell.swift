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
        
        title.textColor = UIColor(red: 0.227, green: 0.651, blue: 0.725, alpha: 1)
        title.textAlignment = .left
        title.font = .systemFont (ofSize: 24, weight: .regular)
        title.text = "Consulta 1"
        
        
        
        return title
    }()
    
    private let dateLabel: UILabel = {
        let date = UILabel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        
        date.textColor = UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1.00)
        date.textAlignment = .left
        date.font = .systemFont (ofSize: 16, weight: .light)
        date.text = dateFormatter.string(from: Date())
      
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

