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
        pregnantData.setButtonHandler(handler: #selector(presentPhotoGalleryPicker))
    }
    
    @objc func presentPhotoGalleryPicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    
    func didSelectImage(image: UIImage) {
        pregnantData.updateButton(img: image)
        ApplicationSettings.saveImage(img: image)
    }

}

