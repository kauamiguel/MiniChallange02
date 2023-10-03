//
//  DefaultView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class DefaultView: UIView{
    
    static let id = "DefaultCell"
    let query = "rotina"
    
    let defaultViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded() ,height:  UIScreen.main.bounds.size.height + UIScreen.main.bounds.size.height / 10) // get the size of the screen portrait need more logic for landscape
    
    let roudedBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .gray
        return view
    }()
    
    let textField2: UITextField = {
        let textField = UITextField().textField(withPlaceholder: "", size: 20)
        textField.textColor = .red
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    // Label
    let title = LabelComponentView()
    
    
    // checkBox
    let checkBox = CheckBoxComponentGreenView()
    let checkBoxRed = CheckBoxComponentRedView()
    let bcfDropDown = DropDownMenuComponent()
    let edemaDropDown = DropDownMenuComponent()
    
    // number picker
    let picker = PickerComponent(data: ["cleber", "rogerio", "Chris"])
    
    // drop down menu
//    let dropDown = DropDownMenuComponent()
    
    
    // stacks
    lazy var pickerVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var pickerHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var stackViewForCheck: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    
    /* ----------------------------------------------------------ANTECEDENTES------------------------------------------------------------- */
 
 
    /* ----------------------------------------------------------picker?------------------------------------------------------------- */
    
    let ddpPicker = PickerComponent(data: ["cleber", "rogerio", "Chris"])
    
    let dppTextField: UITextField = {
        let textField = UITextField().textField(withPlaceholder: "", size: 20)
        textField.textColor = .red
        return textField
    }()
    
    lazy var dppPickerHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
  
  
    
    func setUpView(){
        
        print("a")
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: defaultViewSize.width ,height: defaultViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        //        addSubview(stackView)
        //        stackView.anchorWithConstantValues(left: roudedBackGround.leadingAnchor, right: roudedBackGround.trailingAnchor)
        
        roudedBackGround.addSubview(title)
        title.setupLabel(labelText: "Dados de rotina", labelType: .title, labelColor: .black)
        title.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor, topPadding: 15 ,leftPadding: 20)
        
        
        bcfDropDown.setupButton()
        bcfDropDown.setTitle("BCF", for: .normal)
        bcfDropDown.tableBarView.setupDropDownOptions = ["leve", "moderado", "grave"]
 
        roudedBackGround.addSubview(bcfDropDown)
        roudedBackGround.bringSubviewToFront(bcfDropDown)
        bcfDropDown.isUserInteractionEnabled = true
        
        bcfDropDown.anchorWithConstantValues(top: title.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 20 , leftPadding: 30, width: 150)
        
        
        edemaDropDown.setupButton()
        edemaDropDown.setTitle("Edema", for: .normal)
        edemaDropDown.tableBarView.setupDropDownOptions = ["leve", "moderado", "grave"]
       
        roudedBackGround.addSubview(edemaDropDown)
        roudedBackGround.bringSubviewToFront(edemaDropDown)

        
        edemaDropDown.anchorWithConstantValues(top: title.bottomAnchor, left: bcfDropDown.trailingAnchor, topPadding: 20 ,leftPadding: 30,width: 150)
        
        
//        roudedBackGround.addSubview(pickerHStack)
//        pickerHStack.anchorWithConstantValues(top: title.bottomAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 30)
//        textField2.anchorWithConstantValues(width: 50, height: 20)
//        pickerHStack.addArrangedSubview(textField2)
//        textField2.inputView = picker
        
        /* ----------------------------------------------------------ANTECEDENTES------------------------------------------------------------- */
        
       
        
        
        /* ----------------------------------------------------------dpp------------------------------------------------------------- */
        
//        roudedBackGround.addSubview(dppPickerHStack)
//        dppPickerHStack.anchorWithConstantValues(top: otherSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor,topPadding: 20 ,leftPadding: 30)
//        dppTextField.anchorWithConstantValues(width: 50, height: 20)
//        dppPickerHStack.addArrangedSubview(dppTextField)
//        dppTextField.inputView = ddpPicker
        
      
 
    }
    
    
   
    
    func setUpPlanned(){
        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
}
