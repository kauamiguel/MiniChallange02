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
        button.setTitle("1", for: .normal)
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
        button.setTitle("2", for: .normal)
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
        button.setTitle("3", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
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
        label.font = label.font.withSize(10)
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
        vc.view.addSubview(firstTremesterButton)
        vc.view.addSubview(secondTremesterButton)
        vc.view.addSubview(thirdTremesterButton)
        vc.view.addSubview(userName)
        vc.view.addSubview(userInfo)
        
        
        //Adding constraints
        
        firstTremesterButton.anchorWithConstantValues(width: 100, height: 80)
        secondTremesterButton.anchorWithConstantValues(width: 100, height: 80)
        thirdTremesterButton.anchorWithConstantValues(width: 100, height: 80)
        
        let profileButton = ProfileImageButton(controller: vc)
        vc.view.addSubview(profileButton)
        profileButton.centerX(inView: vc.view)
        profileButton.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor, width: profileButton.defaultSize, height: profileButton.defaultSize)
        userName.centerX(inView: vc.view)
        userName.anchorWithConstantValues(top: profileButton.bottomAnchor, topPadding: 5)
        
        userInfo.centerX(inView: vc.view)
        userInfo.anchorWithConstantValues(top: userName.bottomAnchor, topPadding: 5)
        
        firstTremesterButton.anchorWithConstantValues(top: userInfo.bottomAnchor,left: vc.view.leadingAnchor ,topPadding: 40, leftPadding: 30)
        secondTremesterButton.centerY(inView: vc.view)
        secondTremesterButton.anchorWithConstantValues(right: vc.view.trailingAnchor, rightPadding: -20)
        thirdTremesterButton.anchorWithConstantValues(left: vc.view.leadingAnchor, bottom: vc.view.bottomAnchor, leftPadding: 50, bottomPadding: -100)
    }
    
    
    func drawDashedCurvedLineBetweenButtons(vc : AppointmentsViewController ,isFirstTremesteer : Bool, isSecondTremester : Bool) {
        
        //Create the main points of the curve calculus
        let startPoint = CGPoint(x: firstTremesterButton.frame.maxX, y: firstTremesterButton.center.y)
        let endPoint = CGPoint(x: secondTremesterButton.center.x, y: secondTremesterButton.frame.minY)
        let midPoint = CGPoint(x: (startPoint.x + endPoint.x) / 2, y: (startPoint.y + endPoint.y) / 2)
        
        //Create the 2 points that will help to control the curve
        let controlPoint1 = CGPoint(x: (startPoint.x + midPoint.x) - 200 , y: (startPoint.y + midPoint.y) / 3)
        let controlPoint2 = CGPoint(x: (endPoint.x + midPoint.x)  - 200, y: (endPoint.y + midPoint.y) / 3)
        
        //Create the path based on that point
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        //Draw the path
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        
        if !isFirstTremesteer{
            shapeLayer.opacity = 0.2
        }else{
            shapeLayer.opacity = 1
        }
        
        shapeLayer.lineWidth = 15
        shapeLayer.lineDashPattern = [10, 30]
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = nil
        shapeLayer.lineCap = .round
        
        //Insert in the bottom of the subviews stack
        vc.view.layer.insertSublayer(shapeLayer, at: 0)
        
        
        //Create the points between the middele button and the third button
        let startPointMidButton = CGPoint(x: secondTremesterButton.frame.minX, y: secondTremesterButton.center.y)
        let endPointThirdButton = CGPoint(x: thirdTremesterButton.center.x, y: thirdTremesterButton.center.y)
        let midPointSecondCurve = CGPoint(x: (startPointMidButton.x + endPointThirdButton.x) / 2, y: (startPointMidButton.y + endPointThirdButton.y) / 2)
        
        //Create the main point of the curve
        let controlPoint3 = CGPoint(x: (startPointMidButton.x - midPointSecondCurve.x) / 8 , y: (startPointMidButton.y - midPointSecondCurve.y) + 500)
        let controlPoint4 = CGPoint(x: (endPointThirdButton.x - midPointSecondCurve.x) / 8 , y: (endPointThirdButton.y - midPointSecondCurve.y) + 500)
        
        //Create the path
        let secondPath = UIBezierPath()
        secondPath.move(to: startPointMidButton)
        secondPath.addCurve(to: endPointThirdButton, controlPoint1: controlPoint3, controlPoint2: controlPoint4)
        
        //Draw the path
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.strokeColor = UIColor.red.cgColor
        
        if !isSecondTremester{
            shapeLayer2.opacity = 0.2
        }else{
            shapeLayer2.opacity = 1
        }
        
        shapeLayer2.lineWidth = 15
        shapeLayer2.lineDashPattern = [10, 30]
        shapeLayer2.path = secondPath.cgPath
        shapeLayer2.fillColor = nil
        shapeLayer2.lineCap = .round
        
        vc.view.layer.insertSublayer(shapeLayer2, at: 1)
    }
}

       
  
