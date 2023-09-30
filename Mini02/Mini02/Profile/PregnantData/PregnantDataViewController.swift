//
//  PregnantDataViewController.swift
//  Mini02
//
//  Created by Fabio Freitas on 25/09/23.
//

import UIKit

class PregnantDataViewController: UIViewController {
    private lazy var pregnantData = PregnantDataView()
    private lazy var pregnantDataViewModel = PregnantDataViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        pregnantDataViewModel.viewController = self
        pregnantData.setupPregnantData(vc: self, vm: pregnantDataViewModel)
    }
}

