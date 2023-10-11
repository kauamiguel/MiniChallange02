//
//  appointmentSectionBuilder.swift
//  Mini02
//
//  Created by Daniel Ishida on 09/10/23.
//
import UIKit
import Foundation

extension UIView{
    func createSection(bg:UIView, titles:[String:CheckBoxComponentGreenView]) {
        let screen = UIScreen.main.bounds
        var currentSep:UIView = UIView()
        //ITERATES OVER THE LABELS
        for i in 0...titles.count - 1{
            //SETUP STACK
            let stack = UIStackView()
            stack.axis = .horizontal
            //SETUP LABEL
            let label = LabelComponentView()
            let key = titles.keys.map{$0}[i]
            
            //POPULATES THE STACK
            configureLabelAndGreenCheckBox(
                stack: stack,
                label: label,
                checkBox: titles[key]!,
                labelText: key
            )
            //ADDS STACK TO CONTENT BACKGROUND
            bg.addSubview(stack)
            
            //FIRST ELEMENT CASE
            if i == 0{
                let separator = CustomSeparatorView()
                separator.backgroundColor = UIColor(red: 0.49, green: 0.74, blue: 0.50, alpha: 1.00)
                stack.anchorWithMultiplayerValues(
                    top: bg.topAnchor,
                    topPadding:screen.height * 0.0022,
                    width:UIScreen.main.bounds.width * 0.8
                )
                
                stack.centerX(inView: bg)
                
                bg.addSubview(separator)
                separator.anchorWithMultiplayerValues(
                    top: stack.bottomAnchor,
                    topPadding: screen.height * 0.0022,
                    width: UIScreen.main.bounds.width * 0.9,
                    height: 2
                )
                currentSep = separator
            }
            
            //LAST ELEMENT CASE
            else if i == titles.count-1{
                stack.anchorWithMultiplayerValues(
                    top: currentSep.bottomAnchor,
                    topPadding: screen.height * 0.0022,
                    width:UIScreen.main.bounds.width * 0.8
                )
                stack.centerX(inView: bg)
            }
            
            //NOT THE FIRTS NOT THE LAST CASE
            else{
                let separator = CustomSeparatorView()
                separator.backgroundColor = UIColor(red: 0.49, green: 0.74, blue: 0.50, alpha: 1.00)
                stack.anchorWithMultiplayerValues(
                    top: currentSep.bottomAnchor,
                    topPadding: screen.height * 0.0022,
                    width:UIScreen.main.bounds.width * 0.8
                )
                stack.centerX(inView: bg)
                bg.addSubview(separator)
                separator.anchorWithMultiplayerValues(
                    top: stack.bottomAnchor,
                    topPadding: screen.height * 0.0022,
                    width: screen.width * 0.9,
                    height: 2)
                currentSep = separator
            }
            
       
        }
    }
}


