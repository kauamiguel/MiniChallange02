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
        let text = """
Agora vamos começar com alguns
 dados para te conhecermos melhor!
"""
        label.setupLabel(labelText: text, labelType: .titleSemiBold, labelColor: .primaryText)
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = NextButton()
        return button
    }()
    
    private lazy var placeholderForAsset: UIView = {
       let view = UIView()
        view.backgroundColor = .systemPink
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
        vc.view.addSubview(placeholderForAsset)
        placeholderForAsset.centerX(inView: vc.view)
        placeholderForAsset.anchorWithConstantValues( top: textLabel.bottomAnchor,  topPadding: 82, width: 320, height: 0.35 * UIScreen.main.bounds.height )
        
        vc.view.addSubview(nextButton)
        nextButton.centerX(inView: vc.view)
        nextButton.anchorWithConstantValues(bottom: vc.view.safeAreaLayoutGuide.bottomAnchor, width: 364, height: 0.071 * UIScreen.main.bounds.height)
        nextButton.addAction(UIAction(handler: { _ in
            vc.didTapNext()
        }), for: .touchUpInside)
    }
}
