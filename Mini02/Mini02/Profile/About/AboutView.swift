//
//  AboutView.swift
//  Mini02
//
//  Created by Fabio Freitas on 26/09/23.
//

import Foundation
import UIKit

class AboutView: UIView {
    private lazy var centeredView: UIView = {
       let view = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 572, width: UIScreen.main.bounds.width, height: 572))
        view.backgroundColor = UIColor(red: 255/255, green: 245/255, blue: 245/255, alpha: 1)
        return view
    }()
    
    private func setupCenteredView(vc: UIViewController) {
        vc.view.addSubview(centeredView)
    }
    
    private lazy var titleLabel: UILabel = {
       let label = LabelComponentView()
        label.setupLabel(labelText: "Sobre o Projeto", labelType: .titleBold, labelColor:  .secondaryText)
        return label
    }()
    
    private func setupTitle() {
        centeredView.addSubview(titleLabel)
        centeredView.roundCorners(corners: [.topLeft, .topRight], radius: 10)
        titleLabel.anchorWithConstantValues(top: centeredView.topAnchor, left: centeredView.leadingAnchor, topPadding: 50, leftPadding: 24)
    }
    
    private lazy var descriptionLabel: UILabel = {
       let label = LabelComponentView()
        let text = "O projeto foi desenvolvido na Apple Developer Academy - UCB  com o intuito de digitalizar o cartão de pré natal, auxiliando assim as mamães e os profissionais da área."
        label.setupLabel(labelText: text, labelType: .description, labelColor: .secondaryText)
        return label
    }()
    
    private func setupDescription() {
        centeredView.addSubview(descriptionLabel)
        descriptionLabel.centerX(inView: centeredView)
        descriptionLabel.anchorWithConstantValues(top: titleLabel.bottomAnchor, topPadding: 20, width: 348)
    }
    
    private lazy var teamLabel: UILabel = {
        let teamLabel = LabelComponentView()
        teamLabel.setupLabel(labelText: "O time:", labelType: .highlitedBody, labelColor: .secondaryText)
        return teamLabel
    }()
    
    private func setupTeamLabel() {
        centeredView.addSubview(teamLabel)
        teamLabel.anchorWithConstantValues(top: descriptionLabel.bottomAnchor, left: centeredView.leadingAnchor, topPadding: 20, leftPadding: 20)
    }
    
    private lazy var teamMembersLabel: UILabel = {
        let teamMembersLabel = LabelComponentView()
        let text = """
Christian de Carvalho Almeida Santos: Designer
Daniel Ishida: Coder
Fabio Freitas: Coder
Gabriel Eirado: Coder
Kauã Miguel: Coder
"""
        teamMembersLabel.numberOfLines = 5
        teamMembersLabel.setupLabel(labelText: text, labelType: .inputLabel, labelColor: .secondaryText)
        return teamMembersLabel
    }()
    
    private func setupTeamMembersLabel() {
        centeredView.addSubview(teamMembersLabel)
        teamMembersLabel.anchorWithConstantValues(top: teamLabel.bottomAnchor, left: centeredView.leadingAnchor, topPadding: 11, leftPadding: 20)
    }
    
    func setupAbout(controller vc: UIViewController) {
        vc.view.backgroundColor = .clear
        setupCenteredView(vc: vc)
        setupTitle()
        setupDescription()
        setupTeamLabel()
        setupTeamMembersLabel()
    }
}
