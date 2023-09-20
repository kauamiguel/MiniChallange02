//
//  AppointmentsView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class AppointmentsView: UIView {

    lazy var Vstack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.alignment = .fill
        return stack
    }()
    
    lazy var firstTremesterButton:UIButton = {
        let button = UIButton()
        // Put the right image in the button
//        button.setImage(UIImage(named: image), for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Primeiro trimestre", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    lazy var secondTremesterButton:UIButton = {
        let button = UIButton()
        // Put the right image in the button
//        button.setImage(UIImage(named: image), for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Segundo trimestre", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    lazy var thirdTremesterButton:UIButton = {
        let button = UIButton()
        // Put the right image in the button
//        button.setImage(UIImage(named: image), for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Terceiro trimestre", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    lazy var profileButton : UIButton = {
        let button = UIButton(type: .custom)
        //Put the correct image nome of the asset
        //  button.setImage(UIImage(named: image), for: .normal)
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let userName : UILabel = {
        let label = UILabel()
        label.text = "Larissa alves"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userInfo : UILabel = {
        let label = UILabel()
        label.text = "A+ , 30 anos , Gravidez sem risco"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "systemFont", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //Setup the layout and add Subview into the main view
    func setupView(vc : AppointmentsViewController, action: Selector){
        
        vc.view.backgroundColor = .white
        
        firstTremesterButton.addTarget(vc, action: action, for: .touchUpInside)
        secondTremesterButton.addTarget(vc, action: action, for: .touchUpInside)
        thirdTremesterButton.addTarget(vc, action: action, for: .touchUpInside)
        
        //Setting up the layout of the view
        vc.view.addSubview(Vstack)
        Vstack.addArrangedSubview(firstTremesterButton)
        Vstack.addArrangedSubview(secondTremesterButton)
        Vstack.addArrangedSubview(thirdTremesterButton)
        vc.view.addSubview(profileButton)
        vc.view.addSubview(userName)
        vc.view.addSubview(userInfo)
        
        //Setup constrains of each view
        Vstack.centerX(inView: vc.view)
        Vstack.centerY(inView: vc.view)
        
        firstTremesterButton.anchorWithConstantValues(width: 200, height: 80)
        secondTremesterButton.anchorWithConstantValues(width: 200, height: 80)
        thirdTremesterButton.anchorWithConstantValues(width: 200, height: 80)
        
        profileButton.centerX(inView: vc.view)
        profileButton.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor, width: 50, height: 50)
        userName.centerX(inView: vc.view)
        userName.anchorWithConstantValues(top: profileButton.bottomAnchor, topPadding: 5)
        
        userInfo.centerX(inView: vc.view)
        userInfo.anchorWithConstantValues(top: userName.bottomAnchor, topPadding: 5)
    }
}

       
  
