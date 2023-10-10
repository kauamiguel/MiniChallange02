//
//  appointmentSectionBuilder.swift
//  Mini02
//
//  Created by Daniel Ishida on 09/10/23.
//
import UIKit
import Foundation

extension UIView{
    func createSection(bg:UIView, labels:[LabelComponentView], titles:[String]) {
        let screen = UIScreen.main.bounds
        var currentSep:UIView = UIView()
        //ITERATES OVER THE LABELS
        for i in 0...labels.count - 1{
            //SET UP STACK
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 25
            //POPULATES THE STACK
            configureLabelAndGreenCheckBox(
                stack: stack,
                label: labels[i],
                checkBox: CheckBoxComponentGreenView(),
                labelText: titles[i]
            )
            //ADDS STACK TO CONTENT BACKGROUND
            bg.addSubview(stack)
            if i == 0{
                let separator = CustomSeparatorView()
                stack.anchorWithMultiplayerValues(
                    top: bg.topAnchor,
                    left: bg.leadingAnchor,
                    right: bg.trailingAnchor,
                    topPadding: screen.height * 0.002,
                    leftPadding: 0,
                    rightPadding: 0
                )
                
                bg.addSubview(separator)
                separator.anchorWithMultiplayerValues(
                    top: stack.bottomAnchor,
                    topPadding: screen.height * 0.002,
                    width: UIScreen.main.bounds.width * 0.9,
                    height: 2
                )
                currentSep = separator
            }
            
            else if i == labels.count-1{
                stack.anchorWithMultiplayerValues(
                    top: currentSep.bottomAnchor,
                    left: bg.leadingAnchor,
                    right: bg.trailingAnchor,
                    topPadding: screen.height * 0.002,
                    leftPadding: 0,
                    rightPadding: 0)
            }
            
            else{
                let separator = CustomSeparatorView()
                stack.anchorWithMultiplayerValues(
                    top: currentSep.bottomAnchor,
                    left: bg.leadingAnchor,
                    right: bg.trailingAnchor,
                    topPadding: screen.height * 0.002,
                    leftPadding: 0,
                    rightPadding: 0
                )
                bg.addSubview(separator)
                separator.anchorWithMultiplayerValues(
                    top: stack.bottomAnchor,
                    topPadding: screen.height * 0.002,
                    width: screen.width * 0.9,
                    height: 2)
                currentSep = separator
            }
        }
    }
}
