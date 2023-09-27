//
//  PregnantDataViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 25/09/23.
//

import UIKit

class PregnantDataViewController: UIViewController {
    private lazy var pregnantData = PregnantDataView()

    override func viewDidLoad() {
        super.viewDidLoad()
        pregnantData.setupPregnantData(vc: self)
    }
}

