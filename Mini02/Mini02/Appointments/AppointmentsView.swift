//
//  AppointmentsView.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class AppointmentsView: UIView {
    
    var titles: [String]?
    var collection: UICollectionView?
    var pageControl: UIPageControl?
    var currentPage: Int?
    
    static var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    lazy var Vstack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.alignment = .fill
        return stack
    }()
    
    let userName = LabelComponentView()
    
    //Setup the layout and add Subview into the main view
    
    func setupView(vc : AppointmentsViewController){
        
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
        userName.setupLabel(labelText: name ?? "", labelType: .titleSemiBold, labelColor: .lightPink)
        vc.view.addSubview(userName)
        
        //Adding constraints into profile image and description
        let profileButton = ProfileImageButton(controller: vc)
        profileButton.accessibilityLabel = "Botão de perfil"
        vc.view.addSubview(profileButton)
        profileButton.centerX(inView: vc.view)
        profileButton.anchorWithConstantValues(top: vc.view.safeAreaLayoutGuide.topAnchor, width: profileButton.defaultSize, height: profileButton.defaultSize)
        userName.centerX(inView: vc.view)
        userName.anchorWithConstantValues(top: profileButton.bottomAnchor, topPadding: 5)
        
        guard let collection, let titles, let pageControl, let currentPage else { return }
        collection.backgroundColor = .clear
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.register(AppointmentCell.self, forCellWithReuseIdentifier: AppointmentCell.identifier)
        vc.view.addSubview(collection)
        collection.anchorWithConstantValues(top: userName.bottomAnchor, left: vc.view.safeAreaLayoutGuide.leadingAnchor, right: vc.view.safeAreaLayoutGuide.trailingAnchor, topPadding: 80, height: 440)
        
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = currentPage
        pageControl.pageIndicatorTintColor = UIColor.darkPink()
        pageControl.currentPageIndicatorTintColor = UIColor.lightPink()
        pageControl.hidesForSinglePage = true
        vc.view.addSubview(pageControl)
        pageControl.centerX(inView: collection)
        pageControl.anchorWithConstantValues(top: collection.bottomAnchor)
    }
}

class AppointmentCell: UICollectionViewCell {
    static let identifier = "MyCell"
    
    let buttonImage = UIButton()
    let titleLabel = LabelComponentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(buttonImage)
        buttonImage.centerX(inView: contentView)
        buttonImage.backgroundColor = .clear
        buttonImage.anchorWithConstantValues(leftPadding: 10, rightPadding: 10)
        
        NSLayoutConstraint.activate([
            buttonImage.heightAnchor.constraint(lessThanOrEqualToConstant: 328),
            buttonImage.widthAnchor.constraint(lessThanOrEqualToConstant: 328),
            buttonImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -40)
        ])
        
        contentView.addSubview(titleLabel)
        titleLabel.centerX(inView: contentView)
        titleLabel.anchorWithMultiplayerValues(bottom: contentView.safeAreaLayoutGuide.bottomAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


