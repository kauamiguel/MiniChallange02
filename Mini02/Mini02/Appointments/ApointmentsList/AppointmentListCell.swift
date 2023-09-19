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
        let title = UILabel()
        
        title.textColor = .systemGray
        title.textAlignment = .left
        title.font = .systemFont (ofSize: 18, weight: .regular)
        title.text = "Consulta placeholder"
        
        return title
    }()
    
    private let dateLabel: UILabel = {
        let date = UILabel()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        
        date.textColor = .label
        date.textAlignment = .left
        date.font = .systemFont (ofSize: 10, weight: .light)
        date.text = dateFormatter.string(from: Date())
        
        return date
    }()
    
    func setupUI(){
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.dateLabel)
        
        
        
        
        titleLabel.anchorWithContantValues(
            top: self.topAnchor,
            left: self.leadingAnchor,
            bottom: self.bottomAnchor,
            leftPadding: 30
        )
        
        dateLabel.anchorWithContantValues(
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

