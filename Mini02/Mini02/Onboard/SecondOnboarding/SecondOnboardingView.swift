//
//  SecondOnboardingView.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit

class SecondOnboardingView: UIView {
    private lazy var textLabel: UILabel = {
        let label = LabelComponentView()
        let text = """
Seu cartão de pré-natal agora é
digital, chega de carregar um
pedaço de papel enorme e incomodo.
"""
        label.setupLabel(labelText: text, labelType: .titleSemiBold, labelColor: .primaryText)
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = NextButton()
        return button
    }()
    
    private lazy var illustration: UIImageView = {
        let img = UIImage(named: "Onboarding2")
       let view = UIImageView(image: img)
        return view
    }()
    
    func setupSecondOnboarding(viewController vc: SecondOnboardingViewController) {
        vc.view.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1)

        vc.view.addSubview(textLabel)
        vc.view.bringSubviewToFront(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor, constant: 0.14 * UIScreen.main.bounds.height)
        ])
        vc.view.addSubview(illustration)
        illustration.centerX(inView: vc.view)
        illustration.anchorWithConstantValues( top: textLabel.bottomAnchor,  topPadding: 82, width: min(UIScreen.main.bounds.width * 0.9, 390), height: min(0.35 * UIScreen.main.bounds.height, 336) )
        
        vc.view.addSubview(nextButton)
        nextButton.centerX(inView: vc.view)
        nextButton.anchorWithConstantValues(top: illustration.bottomAnchor, topPadding: 0.12*UIScreen.main.bounds.height, width: 364, height: 0.071 * UIScreen.main.bounds.height)
        nextButton.addAction(UIAction(handler: { _ in
            guard let pageController = vc.pageController as? OnboardingPageViewController else { return }
            pageController.goToNextPage()
            pageController.pageControl.currentPage = 2
        }), for: .touchUpInside)
    }
}
