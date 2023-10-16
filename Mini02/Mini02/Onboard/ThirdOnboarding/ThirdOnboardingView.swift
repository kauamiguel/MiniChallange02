//
//  ThirdOnboardingView.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import Foundation
import UIKit

class ThirdOnboardingView: UIView {
    private lazy var textLabel: UILabel = {
        let label = LabelComponentView()
        let text = "Agora vamos começar com alguns\ndados para te conhecermos melhor!\n".localized()
        label.setupLabel(labelText: text, labelType: .titleSemiBold, labelColor: .primaryText)
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
    
    func setupThirdOnboardingView(viewController vc: ThirdOnboardingViewController) {
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
        nextButton.anchorWithConstantValues(top: illustration.bottomAnchor, topPadding: 0.096*UIScreen.main.bounds.height, width: 364, height: 0.071 * UIScreen.main.bounds.height)
        nextButton.addAction(UIAction(handler: { _ in
            vc.didTapNext()
        }), for: .touchUpInside)
    }
}
