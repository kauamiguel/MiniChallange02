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
        
        bg.backgroundColor = .darkGray
        bg.layer.cornerRadius = 37
        var parent = self.view!
        parent.addSubview(bg)
        
        bg.anchorWithConstantValues(
            bottom: parent.bottomAnchor,
            bottomPadding: -parent.frame.height * 0.05,
            width: self.view.bounds.width * 0.95,
            height: self.view.bounds.height * 0.15
        )
        
        bg.centerX(inView: parent)
        // Add the button stack view to the background view
        bg.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: bg.centerYAnchor)
        ])
        
        
     
        return bg
    }
    
    func setupButtons() -> UIStackView{
        
        let screenWidth = UIScreen.main.bounds.width
        let buttonWidth = screenWidth * 0.1 // Adjust the proportion as needed
        
        //Hstack config
        let Hstack = UIStackView()
        Hstack.axis = .horizontal
        Hstack.distribution = .fillEqually
        Hstack.spacing = screenWidth * 0.01
        
        
    //MODAL BUTTON CONFIG
        var btnConfig = UIButton.Configuration.borderless()
        btnConfig.titleAlignment = .leading
        btnConfig.imagePlacement = .top
        
        btnConfig.titleLineBreakMode = .byWordWrapping
       
        //btnConfig.buttonSize = UIButton.Configuration.Size.medium
        //title:ImageName
        let btnArray:[String] = [
            "Sangue",
            "Ultrasom",
            "Vacinas",
            "Notas"
        ]
        
        for i in 0..<btnArray.count{
            let btn = UIButton()
            btn.configuration = btnConfig
            btn.configuration?.title = btnArray[i]
            
            // Create a template image so it scales without distortion
            if let image = UIImage(systemName: "pencil.circle.fill")?.withRenderingMode(.alwaysTemplate) {
                btn.configuration?.image = image
            }
            btn.configuration?.imagePadding = 5
            btn.configuration?.titleLineBreakMode = .byWordWrapping
            btn.configuration?.attributedTitle?.font = .systemFont(ofSize: buttonWidth * 0.4 )
            btn.contentVerticalAlignment = .center
            
            btn.imageView?.anchorWithConstantValues(width: buttonWidth,height: buttonWidth)
            btn.imageView?.centerXAnchor.constraint(equalTo: btn.centerXAnchor).isActive = true
//            btn.imageView?.centerYAnchor.constraint(equalTo: btn.centerYAnchor).isActive = true
           
            btn.titleLabel?.anchorWithConstantValues(top: btn.imageView?.bottomAnchor)
            
            btn.titleLabel?.centerXAnchor.constraint(equalTo: btn.centerXAnchor).isActive = true
            
            btn.imageView?.contentMode = .scaleAspectFit
            
            Hstack.addArrangedSubview(btn)
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
        setupBG()
        setupGestures()
        
        
        
        
    }
    
    @objc func dismissViewController() {
        UIView.animate(withDuration: 0.5 ,delay: 0.1, options: [.curveEaseIn]) {
            self.view.frame.origin.y = UIScreen.main.bounds.height
            
        }completion: { finished in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

class ModalBtn:UIButton{
    
    var text:String?
    var img:String?
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.borderless()
        configuration.title = "Title"
        configuration.image = UIImage(systemName: "swift")
        configuration.titleAlignment = .center
        configuration.imagePlacement = .top
        button.configuration = configuration
         // Add any other button customization here
         return button
     }()
     

     override init(frame: CGRect) {
         super.init(frame: frame)
         setupUI()
     }
     
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setupUI()
     }
     
     private func setupUI() {
         addSubview(button)
         
         // Add constraints to position and size the button, image, and label
         button.translatesAutoresizingMaskIntoConstraints = false
      
         
         
         // Add any other customization or addTarget for button actions
     }
    
    
}

