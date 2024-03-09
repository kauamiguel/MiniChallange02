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
        button.setImage(UIImage(named: "treemesterCircle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isAccessibilityElement = false
        return button
    }()
    
    lazy var secondTremesterButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "treemesterCircle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isAccessibilityElement = false
        return button
    }()
    
    lazy var thirdTremesterButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "treemesterCircle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isAccessibilityElement = false
        return button
    }()
    
    let userName = LabelComponentView()
    
    let labelFirstTreemester : UILabel = {
        let label = UILabel()
        label.text = "1° trimestre".localized()
        label.accessibilityLabel = "Primeiro trimestre"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelSecondTreemester : UILabel = {
        let label = UILabel()
        label.text = "2° trimestre".localized()
        label.accessibilityLabel = "Segundo trimestre"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelThirdTreemester : UILabel = {
        let label = UILabel()
        label.text = "3° trimestre".localized()
        label.accessibilityLabel = "Terceiro trimestre"
        label.textColor = .white
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Setup the layout and add Subview into the main view
    
    func setupView(vc : AppointmentsViewController, firstTreemesterAction: Selector, secondTreemesterAction: Selector, thirdTreemesterAction: Selector){
        
        //Set the background
        let bgImage = UIImage(named: "backGroundTreemester")

        if let image = bgImage {
            
            let screenSize = UIScreen.main.bounds.size

            UIGraphicsBeginImageContextWithOptions(screenSize, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: screenSize))

            
            if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
               
                UIGraphicsEndImageContext()

               
                vc.view.backgroundColor = UIColor(patternImage: newImage)
            }
        }
        
        let name = vc.appointmentViewModelManager?.getName()
        userName.setupLabel(labelText: name ?? "", labelType: .titleSemiBold, labelColor: .secondaryColor)
        
        //Adding actions into buttons
        firstTremesterButton.addTarget(vc, action: firstTreemesterAction, for: .touchUpInside)
        secondTremesterButton.addTarget(vc, action: secondTreemesterAction, for: .touchUpInside)
        thirdTremesterButton.addTarget(vc, action: thirdTreemesterAction, for: .touchUpInside)
        
        
        //Setting up the layout of the view
        vc.view.addSubview(firstTremesterButton)
        firstTremesterButton.addSubview(labelFirstTreemester)
        vc.view.addSubview(secondTremesterButton)
        secondTremesterButton.addSubview(labelSecondTreemester)
        vc.view.addSubview(thirdTremesterButton)
        thirdTremesterButton.addSubview(labelThirdTreemester)
        vc.view.addSubview(userName)
        
        //Adding constraints into profile image and description
        let profileButton = ProfileImageButton(controller: vc)
        profileButton.accessibilityLabel = "Botão de perfil"
        vc.view.addSubview(profileButton)
        profileButton.centerX(inView: vc.view)
        profileButton.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor, width: profileButton.defaultSize, height: profileButton.defaultSize)
        userName.centerX(inView: vc.view)
        userName.anchorWithConstantValues(top: profileButton.bottomAnchor, topPadding: 5)
    
        
        
        //Check wheter is a iPhoneView or iPadView
        if UIDevice.current.userInterfaceIdiom == .phone{
            
            //Add constrains to the buttons
            firstTremesterButton.anchorWithConstantValues(top: userName.bottomAnchor,left: vc.view.leadingAnchor ,topPadding: 40, leftPadding: 30)
            
            secondTremesterButton.centerY(inView: vc.view)
            secondTremesterButton.anchorWithConstantValues(right: vc.view.trailingAnchor, rightPadding: -20)
            thirdTremesterButton.anchorWithConstantValues(left: vc.view.leadingAnchor, bottom: vc.view.bottomAnchor, leftPadding: 100, bottomPadding: -200)
            
        }else{
            //Add constrains to the buttons
            firstTremesterButton.anchorWithConstantValues(top: userName.bottomAnchor,left: vc.view.leadingAnchor ,topPadding: 50, leftPadding: 200)
            
            secondTremesterButton.centerY(inView: vc.view)
            secondTremesterButton.anchorWithConstantValues(right: vc.view.trailingAnchor, rightPadding: -150)
            thirdTremesterButton.anchorWithConstantValues(left: vc.view.leadingAnchor, bottom: vc.view.bottomAnchor, leftPadding: 180, bottomPadding: -300)
        }
        
        //Set the constraints to labels inside the button
        labelFirstTreemester.centerXAnchor.constraint(equalTo: firstTremesterButton.centerXAnchor).isActive = true
        labelFirstTreemester.centerYAnchor.constraint(equalTo: firstTremesterButton.centerYAnchor).isActive = true
        
        labelSecondTreemester.centerXAnchor.constraint(equalTo: secondTremesterButton.centerXAnchor).isActive = true
        labelSecondTreemester.centerYAnchor.constraint(equalTo: secondTremesterButton.centerYAnchor).isActive = true
        
        labelThirdTreemester.centerXAnchor.constraint(equalTo: thirdTremesterButton.centerXAnchor).isActive = true
        labelThirdTreemester.centerYAnchor.constraint(equalTo: thirdTremesterButton.centerYAnchor).isActive = true
    }
    
    
    func drawDashedCurvedLineBetweenButtons(vc : AppointmentsViewController ,isFirstTremesteer : Bool, isSecondTremester : Bool) {
        
        //Create the main points of the curve calculus
        let startPoint = CGPoint(x: firstTremesterButton.frame.maxX, y: firstTremesterButton.center.y)
        let endPoint = CGPoint(x: secondTremesterButton.center.x, y: secondTremesterButton.frame.minY)
        let midPoint = CGPoint(x: (startPoint.x + endPoint.x) / 2, y: (startPoint.y + endPoint.y) / 2)
        
        //Create the 2 points that will help to control the curve
        let controlPoint1 = CGPoint(x: (startPoint.x + midPoint.x) - 200 , y: (startPoint.y + midPoint.y) / 2.5)
        let controlPoint2 = CGPoint(x: (endPoint.x + midPoint.x)  - 200, y: (endPoint.y + midPoint.y) / 2.5)
        
        //Create the path based on that point
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        //Draw the path
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor(named: "PathColor")?.cgColor
        
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
        let midPointSecondCurve = CGPoint(x: (startPointMidButton.x + endPointThirdButton.x) / 2.5, y: (startPointMidButton.y + endPointThirdButton.y) / 2.5)
        
        //Create the main point of the curve
        let controlPoint3 = CGPoint(x: (startPointMidButton.x + midPointSecondCurve.x) / 8 , y: (startPointMidButton.y - midPointSecondCurve.y) + 400)
        let controlPoint4 = CGPoint(x: (endPointThirdButton.x + midPointSecondCurve.x) / 8 , y: (endPointThirdButton.y - midPointSecondCurve.y) + 400)
        
        //Create the path
        let secondPath = UIBezierPath()
        secondPath.move(to: startPointMidButton)
        secondPath.addCurve(to: endPointThirdButton, controlPoint1: controlPoint3, controlPoint2: controlPoint4)
        
        //Draw the path
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.strokeColor = UIColor(named: "PathColor")?.cgColor
        
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



