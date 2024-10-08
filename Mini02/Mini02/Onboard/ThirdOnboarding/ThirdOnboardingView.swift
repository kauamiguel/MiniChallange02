//
//  ThirdOnboardingView.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import Foundation
import UIKit

class ThirdOnboardingView: UIView {
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: UIScreen.main.bounds.height * 0.15, right: 0)
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let label = LabelComponentView()
        let text = "Agora vamos começar com alguns\ndados para te conhecermos melhor!\n".localized()
        label.setupLabel(labelText: text, labelType: .titleSemiBold, labelColor: .primaryText)
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.96
        label.numberOfLines = 12
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = NextButton()
        return button
    }()
    
    private lazy var illustration: UIImageView = {
        let img = UIImage(named: "Onboarding3")
       let view = UIImageView(image: img)
        return view
    }()
    
    private func setupScrollView(vc: UIViewController) {
        vc.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: vc.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
                    scrollView.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
                    scrollView.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),

                    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                ])
    }
    
    func setupThirdOnboardingView(viewController vc: ThirdOnboardingViewController) {
        vc.view.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1)
        
        setupScrollView(vc: vc)
        contentView.addSubview(textLabel)
        contentView.bringSubviewToFront(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0.10 * UIScreen.main.bounds.height)
        ])
        contentView.addSubview(illustration)
        illustration.centerX(inView: contentView)
        illustration.anchorWithConstantValues(top: textLabel.bottomAnchor,  topPadding: 82, width: min(UIScreen.main.bounds.width * 0.9, 390), height: min(0.375 * UIScreen.main.bounds.height, 350))
        
        contentView.addSubview(nextButton)
        nextButton.centerX(inView: contentView)
        nextButton.anchorWithConstantValues(top: illustration.bottomAnchor, topPadding: 0.096*UIScreen.main.bounds.height, width: UIScreen.main.bounds.width * 0.8, height: 0.071 * UIScreen.main.bounds.height)
        nextButton.addAction(UIAction(handler: { _ in
            vc.didTapNext()
        }), for: .touchUpInside)
    }
}
