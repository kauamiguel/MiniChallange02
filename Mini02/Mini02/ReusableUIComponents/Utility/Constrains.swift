//
//  Constrains.swift
//  Mini02
//
//  Created by Gabriel Eirado on 18/09/23.
//

import Foundation
import UIKit

extension UIView {
    
    func centerX(inView view: UIView){
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView){
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func anchorWithConstantValues(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                topPadding: CGFloat = 0,
                leftPadding: CGFloat = 0,
                rightPadding: CGFloat = 0,
                bottomPadding: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
      translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        if let left = left{
            leadingAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        if let right = right{
            trailingAnchor.constraint(equalTo: right, constant: rightPadding).isActive = true
        }
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: bottomPadding).isActive = true
        }
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        if let width = width{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
    func anchorWithMultiplayerValues(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                topPadding: CGFloat = 0,
                leftPadding: CGFloat = 0,
                rightPadding: CGFloat = 0,
                bottomPadding: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
      translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalToSystemSpacingBelow: top, multiplier: topPadding).isActive = true
        }
        if let left = left{
            leadingAnchor.constraint(equalToSystemSpacingAfter: left, multiplier: leftPadding).isActive = true
        }
        if let right = right{
            trailingAnchor.constraint(equalToSystemSpacingAfter: right, multiplier: rightPadding).isActive = true
        }
        if let bottom = bottom{
            bottomAnchor.constraint(equalToSystemSpacingBelow: bottom, multiplier: bottomPadding).isActive = true
        }
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        if let width = width{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
        
}


