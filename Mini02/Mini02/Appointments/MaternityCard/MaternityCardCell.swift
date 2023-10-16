//
//  AntenatalViewModel.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardCell: UICollectionViewCell {
    
    
    var onDeleteButtonTapped: (() -> Void)?
    
    var isEditModeActive: Bool = false {
        didSet {
            deleteButton.isHidden = !isEditModeActive
        }
    }
    
    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delete".localized(), for: .normal)
        
        return button
    }()
    
    func setUpcell(view: UIView){
        contentView.addSubview(view)
        
        view.anchorWithConstantValues(top: contentView.topAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor)
        
        contentView.addSubview(deleteButton)
        
        deleteButton.anchorWithConstantValues(top: contentView.topAnchor, right: contentView.trailingAnchor, rightPadding: -15)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
    }
    
    func setUpcellDataView(view: UIView?){
        if let view = view{
            contentView.addSubview(view)
            view.anchorWithConstantValues(top: contentView.topAnchor, left: contentView.leadingAnchor, right: contentView.trailingAnchor)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        contentView.endEditing(true)
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        onDeleteButtonTapped?()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Reset the cell's state when it's dequeued.
        deleteButton.isHidden = true
    }
    
    
}
