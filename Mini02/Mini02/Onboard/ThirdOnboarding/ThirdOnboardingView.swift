//
//  ThirdOnboardingView.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import Foundation
import UIKit

class ThirdOnboardingView: UIView {
    func setupThirdOnboardingView(viewController vc: UIViewController) {
        vc.view.backgroundColor = .systemMint
        
        let textLabel: UILabel = {
            let label = UILabel()
            label.text = "Onboarding 3: Swipe To Continue 👉"
            label.textColor = .white
            label.font = label.font.withSize(20)
            return label
        }()
        vc.view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])
    }
}
