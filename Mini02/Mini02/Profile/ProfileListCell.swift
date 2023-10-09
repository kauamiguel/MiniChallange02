//
//  ProfileListCell.swift
//  Mini02
//
//  Created by Fabio Freitas on 26/09/23.
//

import Foundation
import UIKit

class ProfileListCell: UITableViewCell {
    
    static let identifier = "ProfiletListCell"
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .left
        title.font = .systemFont (ofSize: 16)
        title.text = "<unknown>"
        return title
    }()
    
    private lazy var icon: UIImageView = {
        let image = UIImage(systemName: "chevron.right")
        let icon = UIImageView(image: image)
        icon.tintColor = .gray
        return icon
    }()
    
    func setupUI(){
        self.layoutMargins = UIEdgeInsets.zero
        self.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(icon)
        titleLabel.anchorWithConstantValues(
            left: self.leadingAnchor
        )
        
        icon.anchorWithConstantValues(
            right: self.trailingAnchor,
            height: 24
        )
        icon.centerY(inView: self)
        icon.centerY(inView: titleLabel)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellName(name: String) {
        titleLabel.text = name
    }
    
}

