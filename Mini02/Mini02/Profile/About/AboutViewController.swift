//
//  AboutViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 25/09/23.
//

import UIKit

class AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let aboutView = AboutView()
        aboutView.setupAbout(controller: self)
    }
}
