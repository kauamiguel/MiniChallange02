//
//  DefaultView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class DefaultView: UIView{
    
    static let id = "DefaultCell"
    
    let defaultViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded() ,height:  UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height * 0.5) // get the size of the screen portrait need more logic for landscape
    
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
    
    // number picker
    let picker = PickerComponent(data: ["cleber", "rogerio", "Chris"])

    // drop down menu
    let dropDown = DropDownMenuComponent()
    
    
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
    
 
    let labelSIM = LabelComponentView()
    let labelNAO = LabelComponentView()
    
    let hipertencaoLabel = LabelComponentView()
    let hipertencaoCheckSIM = CheckBoxComponentGreenView()
    let hipertencaoCheckNAO = CheckBoxComponentRedView()

    // stacks
    lazy var antecedentesVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
 
    lazy var antecedentesHStackSIM: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var antecedentesHStackNAO: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()

    
    lazy var antecedentesSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 35
        return stackView
    }()
    
    
    func setUpView(){
        
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: defaultViewSize.width ,height: defaultViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        //        addSubview(stackView)
        //        stackView.anchorWithConstantValues(left: roudedBackGround.leadingAnchor, right: roudedBackGround.trailingAnchor)
        
        roudedBackGround.addSubview(title)
        title.setupLabel(labelText: "Dados de rotina", labelType: .title, labelColor: .black)
        title.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor, topPadding: 15 ,leftPadding: 20)
    

        roudedBackGround.addSubview(pickerHStack)
        pickerHStack.anchorWithConstantValues(top: title.bottomAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 30)
        textField2.anchorWithConstantValues(width: 50, height: 20)
        pickerHStack.addArrangedSubview(textField2)
        textField2.inputView = picker
        
        /* ----------------------------------------------------------ANTECEDENTES------------------------------------------------------------- */
      
        hipertencaoLabel.setupLabel(labelText: "Hipertensão", labelType: .subTitle, labelColor: .black)
        roudedBackGround.addSubview(hipertencaoLabel)
        hipertencaoLabel.anchorWithConstantValues(top: textField2.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 20, leftPadding: 10)
       
        roudedBackGround.addSubview(antecedentesHStackSIM)
        labelSIM.setupLabel(labelText: "Sim", labelType: .smalText, labelColor: .black)
        hipertencaoCheckSIM.setupButton()
        antecedentesHStackSIM.addArrangedSubview(labelSIM)
        antecedentesHStackSIM.addArrangedSubview(hipertencaoCheckSIM)
        
      
        
        roudedBackGround.addSubview(antecedentesHStackNAO)
        labelNAO.setupLabel(labelText: "Não", labelType: .smalText, labelColor: .black)
        hipertencaoCheckNAO.setupButton()
        antecedentesHStackNAO.addArrangedSubview(labelNAO)
        antecedentesHStackNAO.addArrangedSubview(hipertencaoCheckNAO)
        
        antecedentesSubHStack.addArrangedSubview(antecedentesHStackSIM)
        antecedentesSubHStack.addArrangedSubview(antecedentesHStackNAO)
        roudedBackGround.addSubview(antecedentesSubHStack)
        
        antecedentesSubHStack.anchorWithConstantValues(top: hipertencaoLabel.topAnchor, left: hipertencaoLabel.trailingAnchor, topPadding: -6 , leftPadding: 85)
        
     
       


        
        
       
//        dropDown.setUpDropDown()
//        roudedBackGround.superview?.addSubview(dropDown)
//        dropDown.anchorWithConstantValues(top: textField2.bottomAnchor, width: 100, height: 50)
        
//        checkBox.setupButton()
//        checkBoxRed.setupButton()
//        stackViewForCheck.addArrangedSubview(checkBox)
//        stackViewForCheck.addArrangedSubview(checkBoxRed)
//        roudedBackGround.addSubview(stackViewForCheck)
//        stackViewForCheck.anchorWithConstantValues(top: pi.bottomAnchor, right: roudedBackGround.trailingAnchor)
        
        //
        //        questionLabel1.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor, topPadding: 10,leftPadding: 10)
        //
        //        roudedBackGround.addSubview(textField)
        //
        //        textField.anchorWithConstantValues(top: questionLabel1.bottomAnchor,left: questionLabel1.leadingAnchor ,width: 200)
        //
        //        roudedBackGround.addSubview(checkBox)
        //        checkBox.anchorWithConstantValues(top: textField.bottomAnchor)
        //        checkBox.centerX(inView: self)
        
        //        roudedBackGround.addSubview(checkBoxRed)
        //        checkBoxRed.anchorWithConstantValues(right: checkBox.trailingAnchor, rightPadding: 50)
        //
        //        label.setupLabel(labelText: "ALOOOOO", labelType: .title, labelColor: .black)
        //        roudedBackGround.addSubview(label)
        //        label.anchorWithConstantValues(top: checkBox.bottomAnchor)
        //
        //
        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
}
