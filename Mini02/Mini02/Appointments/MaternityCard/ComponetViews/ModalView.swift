//
//  ModalView.swift
//  Mini02
//
//  Created by Daniel Ishida on 25/09/23.
//

import Foundation
import UIKit




class ModalVC:UIViewController{
    
    func setupBG() -> UIView{
        let bg = UIView()
        let button = setupButtons()
        bg.frame = CGRect(x: 0, y: 0, width: 375, height: 128)
        bg.backgroundColor = .blue
        bg.layer.cornerRadius = 37
        var parent = self.view!
        parent.addSubview(bg)
        
        bg.anchorWithConstantValues(
            bottom: parent.bottomAnchor,
            bottomPadding: -parent.frame.height * 0.05,
            width: 375,
            height: 128
        )
        
        bg.centerX(inView: parent)
        bg.addSubview(button)
        
        return bg
    }
    
    func setupButtons() -> UIStackView{
        let Hstack = UIStackView()
        Hstack.axis = .horizontal
        Hstack.distribution = .equalSpacing
       
        
        for i in 1...4 {
            let button = UIButton(type: .system)
            button.setTitle("Button \(i)", for: .normal)
            Hstack.addArrangedSubview(button)
            button.centerX(inView: Hstack)
            button.centerY(inView: Hstack)
        }
        
       
        
        
        return Hstack
    }
    
    func setupGestures(){
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismissViewController))
        swipeDown.direction = .down
        
        
        view.addGestureRecognizer(swipeDown)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bg = setupBG()
        setupGestures()
        
        
        
        
    }
    
    @objc func dismissViewController() {
        UIView.animate(withDuration: 1.5,delay: 0, options: [.curveEaseOut]) {
            self.view.frame.origin.y = UIScreen.main.bounds.height
            
        }completion: { finished in
            self.dismiss(animated: false, completion: nil)
        }
    }
}
