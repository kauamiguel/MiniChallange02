//
//  FirstOnboardingView.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import UIKit

class FirstOnboardingView: UIView {
    func setupFirstOnboarding(viewController vc: UIViewController) {
        vc.view.backgroundColor = .systemPink
        let textLabel: UILabel = {
            let label = UILabel()
            label.text = "Onboarding 1: Swipe To Continue 👉"
            
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
