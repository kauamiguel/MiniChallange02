//
//  DefaultView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class DefaultView: UIView{
    
    static let id = "DefaultCell"
    
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
    let antecedentesLabel = LabelComponentView()
    
    // stacks
    lazy var antecedentesVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    /* ----------------------------------------------------------HYPERTENSION------------------------------------------------------------- */
    
    
    let hypertensionLabelYES = LabelComponentView()
    let hypertensionLabelNO = LabelComponentView()
    let hypertensionLabel = LabelComponentView()
    
    let hypertensionCheckYES = CheckBoxComponentGreenView()
    let hypertensionCheckNO = CheckBoxComponentRedView()
    
    lazy var hypertensionHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var hypertensionHStackNO: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    
    lazy var hypertensionSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------Diabetes------------------------------------------------------------- */
    let diabetesLabelYES = LabelComponentView()
    let diabetesLabelNO = LabelComponentView()
    let diabetesLabel = LabelComponentView()
    
    let diabetesCheckYES = CheckBoxComponentGreenView()
    let diabetesCheckNO = CheckBoxComponentRedView()
    
    lazy var diabetesHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var diabetesHStackNO: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    
    lazy var diabetesSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------TWIN------------------------------------------------------------- */
    let twinLabelYES = LabelComponentView()
    let twinLabelNO = LabelComponentView()
    let twinLabel = LabelComponentView()
    
    let twinCheckYES = CheckBoxComponentGreenView()
    let twinCheckNO = CheckBoxComponentRedView()
    
    lazy var twinHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var twinHStackNO: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    
    lazy var twinSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------OTHER------------------------------------------------------------- */
    let otherLabelYES = LabelComponentView()
    let otherLabelNO = LabelComponentView()
    let otherLabel = LabelComponentView()
    
    let otherCheckYES = CheckBoxComponentGreenView()
    let otherCheckNO = CheckBoxComponentRedView()
    
    lazy var otherHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var otherHStackNO: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    
    lazy var otherSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
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
    
    /* ----------------------------------------------------------Tipos de gravidez------------------------------------------------------------- */
    
    let pregnancyTypeLabel = LabelComponentView()
    
    // stacks
    lazy var  pregnancyTypeVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    /* ----------------------------------------------------------única------------------------------------------------------------- */
    
    let uniqueLabel = LabelComponentView()
    
    let uniqueCheckYES = CheckBoxComponentGreenView()

    
    lazy var uniqueSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------twinType------------------------------------------------------------- */

    let twinTypeLabel = LabelComponentView()
    
    let twinTypeCheckYES = CheckBoxComponentGreenView()

    lazy var twinTypeSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    
    /* ----------------------------------------------------------triple or more------------------------------------------------------------- */
    
    let tripleOrMoreLabel = LabelComponentView()
    
    let tripleOrMoreCheckYES = CheckBoxComponentGreenView()
    
    lazy var tripleOrMoreSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    
    /* ----------------------------------------------------------ignored------------------------------------------------------------- */
    let ignoredLabel = LabelComponentView()
    
    let ignoredCheckYES = CheckBoxComponentGreenView()
    
    
    lazy var ignoredSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------planned------------------------------------------------------------- */
    
    let plannedLabel = LabelComponentView()
    let plannedLabelYES = LabelComponentView()
    let plannedLabelNO = LabelComponentView()
    
    let plannedCheckYES = CheckBoxComponentGreenView()
    let plannedCheckNO = CheckBoxComponentRedView()
    
    lazy var plannedHStackYES: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var plannedHStackNO: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    
    lazy var plannedSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------risk------------------------------------------------------------- */
    
    let riskLabel = LabelComponentView()
    
    /* ----------------------------------------------------------habitual------------------------------------------------------------- */
   
    let habitualLabel = LabelComponentView()
    
    let habitualCheckYES = CheckBoxComponentGreenView()
    
    lazy var habitualSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    /* ----------------------------------------------------------high------------------------------------------------------------- */
    
    let highLabel = LabelComponentView()
    
    let highCheckYES = CheckBoxComponentGreenView()
    
    lazy var highSubHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
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
        
        
        
        
        bcfDropDown.setupButton()
        bcfDropDown.setTitle("BCF", for: .normal)
        bcfDropDown.tableBarView.setupDropDownOptions = ["leve", "moderado", "grave"]
 
       
        roudedBackGround.addSubview(bcfDropDown)
        roudedBackGround.bringSubviewToFront(bcfDropDown)
        bcfDropDown.isUserInteractionEnabled = true
        
        bcfDropDown.anchorWithConstantValues(top: title.bottomAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 30, width: 150)
        
        
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
        
        roudedBackGround.addSubview(antecedentesLabel)
        antecedentesLabel.setupLabel(labelText: "Antecedentes Familiares", labelType: .title, labelColor: .black)
        antecedentesLabel.anchorWithConstantValues(top: bcfDropDown.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 25 ,leftPadding: 20)
        
        
        /* ----------------------------------------------------------HStack1------------------------------------------------------------- */
        
        setUpHypertension()
        
        /* ----------------------------------------------------------HStack2------------------------------------------------------------- */
        
        setUpDiabetes()
        
        /* ----------------------------------------------------------HStack3------------------------------------------------------------- */
        
        setUpTwin()
        
        /* ----------------------------------------------------------HStack4------------------------------------------------------------- */
        
        setUpOther()
        
        /* ----------------------------------------------------------dpp------------------------------------------------------------- */
        
        roudedBackGround.addSubview(dppPickerHStack)
        dppPickerHStack.anchorWithConstantValues(top: otherSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor,topPadding: 20 ,leftPadding: 30)
        dppTextField.anchorWithConstantValues(width: 50, height: 20)
        dppPickerHStack.addArrangedSubview(dppTextField)
        dppTextField.inputView = ddpPicker
        
        /* ----------------------------------------------------------Tipos de gravidez------------------------------------------------------------- */
        
        
        roudedBackGround.addSubview(pregnancyTypeLabel)
        pregnancyTypeLabel.setupLabel(labelText: "Tipos de gravidez", labelType: .title, labelColor: .black)
        pregnancyTypeLabel.anchorWithConstantValues(top: dppTextField.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 15 ,leftPadding: 20)
        
        /* ----------------------------------------------------------única------------------------------------------------------------- */
        
        setUpUnique()
        
        /* ----------------------------------------------------------twinType------------------------------------------------------------- */
        
        setUptwinType()
        
        /* ----------------------------------------------------------triple or more------------------------------------------------------------- */
        
        setUpTripleOrMore()
        
        /* ----------------------------------------------------------ignored------------------------------------------------------------- */
        
        setUpIgnored()
        
        /* ----------------------------------------------------------planned?------------------------------------------------------------- */
        
        setUpPlanned()
       
        /* ----------------------------------------------------------risk------------------------------------------------------------- */
       
        roudedBackGround.addSubview(riskLabel)
        riskLabel.setupLabel(labelText: "Risco da gravidez ", labelType: .title, labelColor: .black)
        riskLabel.anchorWithConstantValues(top: plannedSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 35 ,leftPadding: 20)
       
        /* ---------------------------------------------------------- habitual------------------------------------------------------------- */
        
        roudedBackGround.addSubview(habitualSubHStack)
        habitualLabel.setupLabel(labelText: "Risco habitual", labelType: .medicText, labelColor: .black)
        habitualCheckYES.setupButton()
        habitualSubHStack.addArrangedSubview(habitualLabel)
        habitualSubHStack.addArrangedSubview(habitualCheckYES)
        habitualSubHStack.anchorWithConstantValues(top: riskLabel.bottomAnchor, left: roudedBackGround.leadingAnchor ,right: roudedBackGround.trailingAnchor, topPadding: 15, leftPadding: 20 ,rightPadding: -35)
        
        /* ----------------------------------------------------------high------------------------------------------------------------- */
        
        roudedBackGround.addSubview(highSubHStack)
        highLabel.setupLabel(labelText: "Alto risco", labelType: .medicText, labelColor: .black)
        highCheckYES.setupButton()
        highSubHStack.addArrangedSubview(highLabel)
        highSubHStack.addArrangedSubview(highCheckYES)
        highSubHStack.anchorWithConstantValues(top: habitualSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor ,right: roudedBackGround.trailingAnchor, topPadding: 15, leftPadding: 20 ,rightPadding: -35)
    }
    
    
    func setUpHypertension(){
        
        hypertensionLabel.setupLabel(labelText: "Hipertensão", labelType: .subTitle, labelColor: .black)
        roudedBackGround.addSubview(hypertensionLabel)
        hypertensionLabel.anchorWithConstantValues(top: antecedentesLabel.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 20, leftPadding: 10)
        
        
        roudedBackGround.addSubview(hypertensionHStackYES)
        hypertensionLabelYES.setupLabel(labelText: "Sim", labelType: .medicText, labelColor: .black)
        hypertensionCheckYES.setupButton()
        hypertensionHStackYES.addArrangedSubview(hypertensionLabelYES)
        hypertensionHStackYES.addArrangedSubview(hypertensionCheckYES)
        
        roudedBackGround.addSubview(hypertensionHStackNO)
        hypertensionLabelNO.setupLabel(labelText: "Não", labelType: .medicText, labelColor: .black)
        hypertensionCheckNO.setupButton()
        hypertensionHStackNO.addArrangedSubview(hypertensionLabelNO)
        hypertensionHStackNO.addArrangedSubview(hypertensionCheckNO)
        
        hypertensionSubHStack.addArrangedSubview(hypertensionHStackYES)
        hypertensionSubHStack.addArrangedSubview(hypertensionHStackNO)
        roudedBackGround.addSubview(hypertensionSubHStack)
        
        hypertensionSubHStack.anchorWithConstantValues(top: hypertensionLabel.topAnchor, right: roudedBackGround.trailingAnchor, topPadding: -5, rightPadding: -20)
        
    }
    
    func setUpDiabetes(){
        
        diabetesLabel.setupLabel(labelText: "Diabetes", labelType: .subTitle, labelColor: .black)
        roudedBackGround.addSubview(diabetesLabel)
        diabetesLabel.anchorWithConstantValues(top: hypertensionSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 30, leftPadding: 10)
        
        
        roudedBackGround.addSubview(diabetesHStackYES)
        diabetesLabelYES.setupLabel(labelText: "Sim", labelType: .medicText, labelColor: .black)
        diabetesCheckYES.setupButton()
        diabetesHStackYES.addArrangedSubview(diabetesLabelYES)
        diabetesHStackYES.addArrangedSubview(diabetesCheckYES)
        
        roudedBackGround.addSubview(diabetesHStackNO)
        diabetesLabelNO.setupLabel(labelText: "Não", labelType: .medicText, labelColor: .black)
        diabetesCheckNO.setupButton()
        diabetesHStackNO.addArrangedSubview(diabetesLabelNO)
        diabetesHStackNO.addArrangedSubview(diabetesCheckNO)
        
        diabetesSubHStack.addArrangedSubview(diabetesHStackYES)
        diabetesSubHStack.addArrangedSubview(diabetesHStackNO)
        roudedBackGround.addSubview(diabetesSubHStack)
        
        diabetesSubHStack.anchorWithConstantValues(top: diabetesLabel.topAnchor,  right: roudedBackGround.trailingAnchor, topPadding: -6, rightPadding: -20)
        
    }
    
    func setUpTwin(){
        
        twinLabel.setupLabel(labelText: "Gemelar", labelType: .subTitle, labelColor: .black)
        roudedBackGround.addSubview(twinLabel)
        twinLabel.anchorWithConstantValues(top: diabetesSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 30, leftPadding: 10)
        
        
        roudedBackGround.addSubview(twinHStackYES)
        twinLabelYES.setupLabel(labelText: "Sim", labelType: .medicText, labelColor: .black)
        twinCheckYES.setupButton()
        twinHStackYES.addArrangedSubview(twinLabelYES)
        twinHStackYES.addArrangedSubview(twinCheckYES)
        
        roudedBackGround.addSubview(otherHStackNO)
        twinLabelNO.setupLabel(labelText: "Não", labelType: .medicText, labelColor: .black)
        twinCheckNO.setupButton()
        twinHStackNO.addArrangedSubview(twinLabelNO)
        twinHStackNO.addArrangedSubview(twinCheckNO)
        
        twinSubHStack.addArrangedSubview(twinHStackYES)
        twinSubHStack.addArrangedSubview(twinHStackNO)
        roudedBackGround.addSubview(twinSubHStack)
        
        twinSubHStack.anchorWithConstantValues(top: twinLabel.topAnchor,  right: roudedBackGround.trailingAnchor, topPadding: -6, rightPadding: -20)
        
        
    }
    
    func setUpOther(){
        
        otherLabel.setupLabel(labelText: "Other(do more)", labelType: .subTitle, labelColor: .black)
        roudedBackGround.addSubview(otherLabel)
        otherLabel.anchorWithConstantValues(top: twinSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 30, leftPadding: 10)
        
        
        roudedBackGround.addSubview(otherHStackYES)
        otherLabelYES.setupLabel(labelText: "Sim", labelType: .medicText, labelColor: .black)
        otherCheckYES.setupButton()
        otherHStackYES.addArrangedSubview(otherLabelYES)
        otherHStackYES.addArrangedSubview(otherCheckYES)
        
        roudedBackGround.addSubview(otherHStackNO)
        otherLabelNO.setupLabel(labelText: "Não", labelType: .medicText, labelColor: .black)
        otherCheckNO.setupButton()
        otherHStackNO.addArrangedSubview(otherLabelNO)
        otherHStackNO.addArrangedSubview(otherCheckNO)
        
        otherSubHStack.addArrangedSubview(otherHStackYES)
        otherSubHStack.addArrangedSubview(otherHStackNO)
        roudedBackGround.addSubview(otherSubHStack)
        
        otherSubHStack.anchorWithConstantValues(top: otherLabel.topAnchor,  right: roudedBackGround.trailingAnchor, topPadding: -6, rightPadding: -20)
        
    }
    
    
    func setUpUnique(){
        
        uniqueLabel.setupLabel(labelText: "Única", labelType: .subTitle, labelColor: .black)
        
        uniqueCheckYES.setupButton()
        
        uniqueSubHStack.addArrangedSubview(uniqueLabel)
        uniqueSubHStack.addArrangedSubview(uniqueCheckYES)
        roudedBackGround.addSubview(uniqueSubHStack)
        
        uniqueSubHStack.anchorWithConstantValues(top: pregnancyTypeLabel.bottomAnchor, left: roudedBackGround.leadingAnchor ,right: roudedBackGround.trailingAnchor, topPadding: 20, leftPadding: 15 ,rightPadding: -40)
    }
    
    func setUptwinType(){
        
        twinTypeLabel.setupLabel(labelText: "Gemelar", labelType: .subTitle, labelColor: .black)
        
        twinTypeCheckYES.setupButton()
        
        twinTypeSubHStack.addArrangedSubview(twinTypeLabel)
        twinTypeSubHStack.addArrangedSubview(twinTypeCheckYES)
        roudedBackGround.addSubview(twinTypeSubHStack)
        
        twinTypeSubHStack.anchorWithConstantValues(top: uniqueSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor ,right: roudedBackGround.trailingAnchor, topPadding: 20, leftPadding: 15 ,rightPadding: -40)
    }
    
    func setUpTripleOrMore(){
        
        tripleOrMoreLabel.setupLabel(labelText: "Tripla ou mais", labelType: .subTitle, labelColor: .black)
        
        tripleOrMoreCheckYES.setupButton()
        
        tripleOrMoreSubHStack.addArrangedSubview(tripleOrMoreLabel)
        tripleOrMoreSubHStack.addArrangedSubview(tripleOrMoreCheckYES)
        roudedBackGround.addSubview(tripleOrMoreSubHStack)
        
        tripleOrMoreSubHStack.anchorWithConstantValues(top:  twinTypeSubHStack.bottomAnchor,  left: roudedBackGround.leadingAnchor ,right: roudedBackGround.trailingAnchor, topPadding: 20, leftPadding: 15 ,rightPadding: -40)
        
    }
    
    func setUpIgnored(){
        
        ignoredLabel.setupLabel(labelText: "Ignorada", labelType: .subTitle, labelColor: .black)
        
        ignoredCheckYES.setupButton()
        
        ignoredSubHStack.addArrangedSubview(ignoredLabel)
        ignoredSubHStack.addArrangedSubview(ignoredCheckYES)
        roudedBackGround.addSubview(ignoredSubHStack)
        
        ignoredSubHStack.anchorWithConstantValues(top: tripleOrMoreSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor ,right: roudedBackGround.trailingAnchor, topPadding: 20, leftPadding: 15 ,rightPadding: -40)
    }
    
    
    func setUpPlanned(){
        
        roudedBackGround.addSubview(plannedLabel)
        plannedLabel.setupLabel(labelText: "Gravidez planejada", labelType: .title, labelColor: .black)
        plannedLabel.anchorWithConstantValues(top: ignoredSubHStack.bottomAnchor, left: roudedBackGround.leadingAnchor, topPadding: 35 ,leftPadding: 20)
        
        roudedBackGround.addSubview(plannedHStackYES)
        plannedLabelYES.setupLabel(labelText: "Sim", labelType: .medicText, labelColor: .black)
        plannedCheckYES.setupButton()
        plannedHStackYES.addArrangedSubview(plannedLabelYES)
        plannedHStackYES.addArrangedSubview(plannedCheckYES)
        
        roudedBackGround.addSubview(plannedHStackNO)
        plannedLabelNO.setupLabel(labelText: "Não", labelType: .medicText, labelColor: .black)
        plannedCheckNO.setupButton()
        plannedHStackNO.addArrangedSubview(plannedLabelNO)
        plannedHStackNO.addArrangedSubview(plannedCheckNO)
        
        plannedSubHStack.addArrangedSubview(plannedHStackYES)
        plannedSubHStack.addArrangedSubview(plannedHStackNO)
        roudedBackGround.addSubview(plannedSubHStack)
        
        plannedSubHStack.anchorWithConstantValues(top: plannedLabel.topAnchor, left: roudedBackGround.leadingAnchor, topPadding: 45, leftPadding: 40)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
}
