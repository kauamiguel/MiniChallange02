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
        
        bg.backgroundColor = UIColor(red: 1, green: 0.933, blue: 0.933, alpha: 1)
        bg.layer.cornerRadius = 37
        let parent = self.view!
        parent.addSubview(bg)
        bg.layer.borderWidth = 2
        bg.layer.borderColor = UIColor.darkPink().cgColor
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
        let buttonWidth = screenWidth * 0.11// Adjust the proportion as needed
        
        //Hstack config
        let Hstack = UIStackView()
        Hstack.axis = .horizontal
        Hstack.distribution = .fillEqually
        Hstack.spacing = screenWidth * 0.01
        
        //title:ImageName
        let btnArray:[String] = [
            "Sangue".localized(),
            "Ultrassom".localized(),
            "Vacinas".localized(),
            "Notas".localized()
        ]
        let ImagebtnArray:[String] = [
            "blood",
            "ultrasound",
            "vaccine",
            "note"
        ]
        
        for i in 0..<btnArray.count{
            let btn = UIButton()
           
            //MODAL BUTTON CONFIG
            var btnConfig = UIButton.Configuration.borderless()
            btnConfig.titleAlignment = .leading
            btnConfig.imagePlacement = .top
            btnConfig.title = btnArray[i]
            btnConfig.titleLineBreakMode = .byWordWrapping
            btnConfig.attributedTitle?.font = UIFont(name: "Signika-Regular", size:screenWidth * 0.03)
            btn.tintColor = UIColor.darkPink()
            // Create a template image so it scales without distortion
            if let image = UIImage(named: ImagebtnArray[i])?.withRenderingMode(.automatic) {
                btnConfig.image = image
            }

            btnConfig.imagePadding = 5
            
            //Assigns the configuration to the button
            btn.configuration = btnConfig
        

            btn.contentVerticalAlignment = .center
            
            //Setting constrains to the image
            btn.imageView?.anchorWithConstantValues(width: buttonWidth,height: buttonWidth)
            btn.imageView?.centerXAnchor.constraint(equalTo: btn.centerXAnchor).isActive = true
            //btn.imageView?.centerYAnchor.constraint(equalTo: btn.centerYAnchor).isActive = true
            
            //Setting constrains to the button title
            btn.titleLabel?.anchorWithConstantValues(top: btn.imageView?.bottomAnchor)
            btn.titleLabel?.centerXAnchor.constraint(equalTo: btn.centerXAnchor).isActive = true
            
       
            
            //Adds targets to the buttons
            switch i{
            case 0:
                btn.addTarget(collectionView, action: #selector(collectionView?.addNewBloodViewCell), for: .touchUpInside)
            case 1:
                btn.addTarget(collectionView, action: #selector(collectionView?.addNewUltrassonViewCell), for: .touchUpInside)
            case 2:
                btn.addTarget(collectionView, action: #selector(collectionView?.addNewVaccineViewCell), for: .touchUpInside)
                
           //MARK: EIRADO SUBSTITUIR O ACTION PELA NOVA FUNÇÃO DE ADICIONAR CELULA DE NOTAS
            case 3:
                btn.addTarget(collectionView, action: #selector(collectionView?.addTextViewCell), for: .touchUpInside)
            default:
                print("Something broke")
            }
            
            
            
            btn.imageView?.contentMode = .scaleAspectFit
            
            Hstack.addArrangedSubview(btn)
            //Hstack.backgroundColor = .red
            Hstack.anchorWithConstantValues(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.1)
            btn.imageView?.anchorWithConstantValues(bottom: Hstack.centerYAnchor, bottomPadding: buttonWidth * 0.25)
           // btn.centerYAnchor.constraint(equalTo: Hstack.centerYAnchor).isActive = true
        }

        return Hstack
    }
    
    //MARK: GESTURE FOR DISMISS FUNCTION
    func setupGestures(){
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismissViewController))
        swipeDown.direction = .down
        
        // Add the tap gesture recognizer
        let touchOutside = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
  
        view.addGestureRecognizer(touchOutside)
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
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let tapLocation = gestureRecognizer.location(in: view)

        // Check if the tap location is above the 'bg' element
        if tapLocation.y < self.view.bounds.height * 0.80{
            dismissViewController()
        }
    }
    
}

