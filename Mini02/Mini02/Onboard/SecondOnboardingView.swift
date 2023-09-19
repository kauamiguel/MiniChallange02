//
//  SecondOnboardingView.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit

class SecondOnboardingView: UIView {
    func setupSecondOnboarding(viewController vc: UIViewController) {
        vc.view.backgroundColor = .systemCyan
        let textLabel: UILabel = {
            let label = UILabel()
            label.text = "Onboarding 2: Swipe To Continue 👉"
            
            label.textColor = .white
            label.font = label.font.withSize(20)
            return label
        }()
        vc.view.addSubview(textLabel)
        vc.view.bringSubviewToFront(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])
    }
}
