//
//  ModalView.swift
//  Mini02
//
//  Created by Daniel Ishida on 25/09/23.
//

import Foundation
import UIKit




class ModalVC: UIViewController{
    
    var collectionView: MaternityCardViewController?
    
    func setupBG(){
        let bg = UIView()
        let button = setupButtons()
        
        bg.backgroundColor = .darkGray
        bg.layer.cornerRadius = 37
        let parent = self.view!
        parent.addSubview(bg)
        
        //Contrains of the modal
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
        
        
        //Position of the buttons on the modal
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: bg.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: bg.centerYAnchor)
        ])

    }
    
    func setupButtons() -> UIStackView{
        let screenWidth = UIScreen.main.bounds.width
        let buttonWidth = screenWidth * 0.1 // Adjust the proportion as needed
        
        //Hstack config
        let Hstack = UIStackView()
        Hstack.axis = .horizontal
        Hstack.distribution = .fillEqually
        Hstack.spacing = screenWidth * 0.01
        
        //title:ImageName
        let btnArray:[String] = [
            "Sangue",
            "Ultrassom",
            "Vacinas",
            "Notas"
        ]
        
        for i in 0..<btnArray.count{
            let btn = UIButton()
           
            //MODAL BUTTON CONFIG
            var btnConfig = UIButton.Configuration.borderless()
            btnConfig.titleAlignment = .leading
            btnConfig.imagePlacement = .top
            btnConfig.title = btnArray[i]
            btnConfig.titleLineBreakMode = .byWordWrapping
            btnConfig.attributedTitle?.font = UIFont.systemFont(ofSize: buttonWidth * 0.3 + 1 )
            
            // Create a template image so it scales without distortion
            if let image = UIImage(systemName: "pencil.circle.fill")?.withRenderingMode(.alwaysTemplate) {
                btnConfig.image = image
            }

            btnConfig.imagePadding = 5
            
            //Assigns the configuration to the button
            btn.configuration = btnConfig
        

            btn.contentVerticalAlignment = .center
            
            //Setting constrains to the image
            btn.imageView?.anchorWithConstantValues(width: buttonWidth,height: buttonWidth)
            btn.imageView?.centerXAnchor.constraint(equalTo: btn.centerXAnchor).isActive = true


            
            //Setting constrains to the button title
            btn.titleLabel?.anchorWithConstantValues(top: btn.imageView?.bottomAnchor)
            btn.titleLabel?.centerXAnchor.constraint(equalTo: btn.centerXAnchor).isActive = true
            
            
            switch i{
            case 0:
                btn.addTarget(collectionView, action: #selector(collectionView?.addNewBloodViewCell), for: .touchUpInside)
            case 1:
                btn.addTarget(collectionView, action: #selector(collectionView?.addNewUltrassonViewCell), for: .touchUpInside)
            case 2:
                btn.addTarget(collectionView, action: #selector(collectionView?.addNewDefaultViewCell), for: .touchUpInside)
            case 3:
                btn.addTarget(collectionView, action: #selector(collectionView?.addNewDefaultViewCell), for: .touchUpInside)
            default:
                print("Something broke")
            }
            
            
            
            btn.imageView?.contentMode = .scaleAspectFit
            
            Hstack.addArrangedSubview(btn)
        }

        return Hstack
    }
    
    //MARK: GESTURE FOR DISMISS FUNCTION
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
    
    //MARK: DISMISS MODAL ANIMATION
    @objc func dismissViewController() {
        UIView.animate(withDuration: 0.5 ,delay: 0.1, options: [.curveEaseIn]) {
            self.view.frame.origin.y = UIScreen.main.bounds.height
            
        }completion: { finished in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
}

