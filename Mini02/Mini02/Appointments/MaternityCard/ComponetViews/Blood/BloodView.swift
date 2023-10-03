//
//  BloodView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

import UIKit

class BloodView: UIView{
    func dropDownPressed(string: String) {
        print("hi")
    }

    static let id = "BloodCell"
    let query = "sangue"
    
    let bloodViewViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height * 0.5)
    
    let roudedBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemRed
        return view
    }()
    
    let questionLabel1: UILabel = {
        let label = UILabel()
        label.text = "BloodView"
        label.textColor = .black
        label.font = label.font.withSize(20)
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField().textField(withPlaceholder: "", size: 20)
        textField.textColor = .red
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    var button = DropDownMenuComponent()

    
    func setUpView() {
        addSubview(roudedBackGround)

        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor, right: self.trailingAnchor, bottom: self.bottomAnchor, width: bloodViewViewSize.width, height: bloodViewViewSize.height)

        roudedBackGround.addSubview(questionLabel1)

        questionLabel1.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor, topPadding: 10, leftPadding: 10)


        button.setTitle("Select", for: .normal)
        button.setupButton()
        button.tableBarView.setupDropDownOptions = ["aaaa", "bbbbb", "ccccc", "ddddd" , "fffffff"]
     
        roudedBackGround.addSubview(button)
    
        button.anchorWithConstantValues(top: questionLabel1.bottomAnchor,left: roudedBackGround.leadingAnchor, leftPadding: 50 ,width: 100)
        

    }
}
