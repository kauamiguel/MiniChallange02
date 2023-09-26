//
//  PregnantDataViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 25/09/23.
//

import UIKit

class PregnantDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pregnantData = PregnantDataView()
        pregnantData.setupPregnantData(vc: self)
    }

}

