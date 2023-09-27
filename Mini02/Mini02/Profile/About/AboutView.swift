//
//  AboutView.swift
//  Mini02
//
//  Created by Fabio Freitas on 26/09/23.
//

import Foundation
import UIKit

class AboutView: UIView {
    func setupAbout(controller vc: UIViewController) {
        vc.view.backgroundColor = .clear
        let centeredView = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 445, width: UIScreen.main.bounds.width, height: 445))
        centeredView.backgroundColor = .systemBackground
        vc.view.addSubview(centeredView)
        let label = UILabel()
        label.text = "Sobre o projeto"
        label.font = .boldSystemFont(ofSize: 24)
        centeredView.addSubview(label)
        centeredView.roundCorners(corners: [.topLeft, .topRight], radius: 10)
        label.anchorWithConstantValues(top: centeredView.topAnchor, left: centeredView.leadingAnchor, topPadding: 50, leftPadding: 24)
    }
}
