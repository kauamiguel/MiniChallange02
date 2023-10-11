//
//  BloodView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 19/09/23.
//

import UIKit

class BloodView: UIView{
    
    static let id = "BloodCell"
    let query = "sangue"
    
    let screenSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    let bloodViewViewSize = CGSize(width: (UIScreen.main.bounds.size.width - UIScreen.main.bounds.size.width * 0.04).rounded(), height: UIScreen.main.bounds.size.height * 1.025)
  
    let roudedBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let contentBackGround: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 1.00, green: 0.97, blue: 0.97, alpha: 1.00)
        
        view.layer.borderWidth = 1 // Adjust the width as needed
        view.layer.borderColor = UIColor(red: 0.23, green: 0.65, blue: 0.73, alpha: 1.00).cgColor // Change color as needed
        
        return view
    }()
    
    let separator = CustomSeparatorView()
    let bloodExamLabel = LabelComponentView()
    
    let FerritinaLabel = LabelComponentView()
    let FerritinaMenu = PullDownComponent()
    
    let aboLabel = LabelComponentView()
    let aboMenu = PullDownComponent()
    
    let htLabel = LabelComponentView()
    let htMenu = PullDownComponent()
    
    let plaquetasLabel = LabelComponentView()
    let  plaquetasMenu = PullDownComponent()
    
    let curvaGlicemicaLabel = LabelComponentView()
    let curvaGlicemicaMenu = PullDownComponent()
    
    let hepatiteLabel = LabelComponentView()
    let hepatiteMenu = PullDownComponent()
    
    let rubeolaLabel = LabelComponentView()
    let rubeolaMenu = PullDownComponent()
    
    let chagasLabel = LabelComponentView()
    let chagasMenu = PullDownComponent()
    
    let tgoLabel = LabelComponentView()
    let tgoMenu = PullDownComponent()
    
    let acidoUricoLabel = LabelComponentView()
    let acidoUricoMenu = PullDownComponent()

    let vitaminaDLabel = LabelComponentView()
    let vitaminaDMenu = PullDownComponent()
    
    let coombsLabel = LabelComponentView()
    let coombsMenu = PullDownComponent()
    
    let leucocitosLabel = LabelComponentView()
    let leucocitosMenu = PullDownComponent()
    
    let glicemiaLabel = LabelComponentView()
    let glicemiaMenu = PullDownComponent()
    
    let epfLabel = LabelComponentView()
    let epfMenu = PullDownComponent()
    
    let citomegalovirusLabel = LabelComponentView()
    let citomegalovirusMenu = PullDownComponent()
    
    let htlvLabel = LabelComponentView()
    let htlvMenu = PullDownComponent()
    
    let ureiaLabel = LabelComponentView()
    let ureiaMenu = PullDownComponent()
    
    let tshLabel = LabelComponentView()
    let tshMenu = PullDownComponent()
    
    let easLabel = LabelComponentView()
    let easMenu = PullDownComponent()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    func setupView(){
        
 
        addSubview(roudedBackGround)
        
        roudedBackGround.anchorWithConstantValues(top: self.topAnchor, left: self.leadingAnchor,right: self.trailingAnchor,bottom: self.bottomAnchor, width: bloodViewViewSize.width ,height: bloodViewViewSize.height)
        
        self.anchorWithConstantValues(top: roudedBackGround.topAnchor, left: roudedBackGround.leadingAnchor,right: roudedBackGround.trailingAnchor,bottom: roudedBackGround.bottomAnchor)
        
        
        self.addSubview(bloodExamLabel)
        bloodExamLabel.setupLabel(labelText: "Exame de sangue", labelType: .titleBold, labelColor: .secondaryColor)
        bloodExamLabel.anchorWithMultiplayerValues(top: self.topAnchor, left: roudedBackGround.leadingAnchor, leftPadding: 1.4)
        
        roudedBackGround.addSubview(contentBackGround)
        contentBackGround.anchorWithConstantValues(top: bloodExamLabel.bottomAnchor, bottom: self.bottomAnchor, topPadding: 10,width: screenSize.width * 0.9, height: screenSize.height * 0.97)
        contentBackGround.centerX(inView: roudedBackGround)
        
        contentBackGround.addSubview(separator)
        separator.anchorWithConstantValues(top: contentBackGround.topAnchor, bottom: contentBackGround.bottomAnchor,topPadding: 15, bottomPadding: -15, width: 1.5)
        separator.centerX(inView: contentBackGround)
        
        //FIXME: PICKER HERE
        menuPlusLabel(label: FerritinaLabel, menu: FerritinaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: contentBackGround, labelText: "Ferritina", topPadding: screenSize.height * 0.0023, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        
        menuPlusLabelBottom(label: aboLabel, menu: aboMenu, options: BloodType.allCases.map { $0.rawValue }, contentBackGround: contentBackGround, topAnchor: FerritinaMenu, leftAnchor: contentBackGround, labelText: "ABO - RH", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: PICKER HERE - HT AND HB ARE TWO DIFFERENT THINGS
        menuPlusLabelBottom(label: htLabel, menu: htMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: aboMenu, leftAnchor: contentBackGround, labelText: "HTª/HB", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: PICKER HERE
        menuPlusLabelBottom(label: plaquetasLabel, menu: plaquetasMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: htMenu, leftAnchor: contentBackGround, labelText: "Plaquetas", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: PICKER HER + ITS NOT MODELED
        menuPlusLabelBottom(label: curvaGlicemicaLabel, menu: curvaGlicemicaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: plaquetasMenu, leftAnchor: contentBackGround, labelText: "Curva Glicêmica", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: IT'S MODELED AS BOOL, CHANGE MODEL OR MAKE THIS A CHECKMARK
        menuPlusLabelBottom(label: hepatiteLabel, menu: hepatiteMenu, options: ["Imune", "negativo", "positivo"], contentBackGround: contentBackGround, topAnchor: curvaGlicemicaMenu, leftAnchor: contentBackGround, labelText: "Hepatite C", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: NOT MODELED + IGM/IGH TEMPLATE
        menuPlusLabelBottom(label: rubeolaLabel, menu: rubeolaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: hepatiteMenu, leftAnchor: contentBackGround, labelText: "Rubéola", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: NOT MODELED + DON'T KNOW HOW TO REGISTER
        menuPlusLabelBottom(label: chagasLabel, menu: chagasMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: rubeolaMenu, leftAnchor: contentBackGround, labelText: "Chagas", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: NOT MODELED + IT'S A PICKER
        menuPlusLabelBottom(label: tgoLabel, menu: tgoMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: chagasMenu, leftAnchor: contentBackGround, labelText: "TGO/TGP", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: NOT MODELED + IT'S A PICKER
        menuPlusLabelBottom(label: acidoUricoLabel, menu: acidoUricoMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: tgoMenu, leftAnchor: contentBackGround, labelText: "Ácido úrico", topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.005, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        
       // RIGHT
        //FIXME: NOT MODELED + IT'S A PICKER
        menuPlusLabelRight(label: vitaminaDLabel, menu: vitaminaDMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: contentBackGround, leftAnchor: separator, labelText: "Vitamina D", topPadding: screenSize.height * 0.0023, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: NOT MODELED + PROBABLY A CHECKMARK
        menuPlusLabelBottom(label: coombsLabel, menu: coombsMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: vitaminaDMenu, leftAnchor: separator, labelText: "COOMBS",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: THIS IS A PICKER
        menuPlusLabelBottom(label: leucocitosLabel, menu: leucocitosMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: coombsMenu, leftAnchor: separator, labelText: "Leucócitos",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
       
        //FIXME: THIS IS A PICKER
        menuPlusLabelBottom(label: glicemiaLabel, menu: glicemiaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: leucocitosMenu, leftAnchor: separator, labelText: "Glicemia",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: NOT MODELED
        menuPlusLabelBottom(label: epfLabel, menu: epfMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: glicemiaMenu, leftAnchor: separator, labelText: "EPF",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: WTF IS THIS
        menuPlusLabelBottom(label: citomegalovirusLabel, menu: citomegalovirusMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: epfMenu, leftAnchor: separator, labelText: "Citomegalovírus",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: NOT MODELED
        menuPlusLabelBottom(label: htlvLabel, menu: htlvMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: citomegalovirusMenu, leftAnchor: separator, labelText: "HTLV",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
        //FIXME: THIS IS A PICKER WITH TWO VALUES: mg/dl
        menuPlusLabelBottom(label: ureiaLabel, menu: ureiaMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: htlvMenu, leftAnchor: separator, labelText: "Ureia/Creatina",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        //FIXME: NOT MODELED
        menuPlusLabelBottom(label: tshLabel, menu: tshMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: ureiaMenu, leftAnchor: separator, labelText: "TSH",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        //FIXME: NOT MODELED
        menuPlusLabelBottom(label: easLabel, menu: easMenu, options: ["aaa", "bbb", "ccc"], contentBackGround: contentBackGround, topAnchor: tshMenu, leftAnchor: separator, labelText: "EAS/Cultura",  topPadding: screenSize.height * 0.0046, leftPadding: screenSize.width * 0.0079, screenSize: screenSize, widthMultiplier: 0.35, heightMultiplier: 0.035)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
