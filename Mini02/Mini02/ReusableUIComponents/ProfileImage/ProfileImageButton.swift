//
//  ProfileImage.swift
//  Mini02
//
//  Created by Fabio Freitas on 27/09/23.
//

import Foundation
import UIKit

class ProfileImageButton: UIButton {
    var defaultSize: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 96
        }
        return 54
    }
    var radius: CGFloat {
        return defaultSize / 2
    }
    private let imagePicker = UIImagePickerController()
    
    private var mode: Mode = .NoAction
    private var viewController: UIViewController?
    
    enum Mode {
        case Edit
        case NoAction
    }
    
    init(mode: Mode = .NoAction, controller: UIViewController? = nil) {
        super.init(frame: .zero)
        self.mode = mode
        self.viewController = controller
        setupPicker()
        setupUI()
        setupTarget()
        
        setupNotif()
    }
    deinit {
        teardownNotif()
    }
    
    func setupNotif() {
        NotificationCenter.default.addObserver(self, selector: #selector(recievedUpdate), name: NSNotification.Name("update.profile.img"), object: nil)
    }
    
    @objc func recievedUpdate() {
        refreshImageOrDefault()
    }
    
    func teardownNotif() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("update.profile.img"), object: nil)
    }
    
    func setupPicker() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
    }
    
    func setupUI(){
        refreshImageOrDefault()
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
    }
    
    func setupTarget() {
        guard case .Edit = mode else {
            self.isEnabled = false
            return
        }
        self.addTarget(self, action: #selector(editHandler), for: .touchUpInside)
    }
    
    func refreshImageOrDefault() {
        if let imageData = ApplicationSettings.loadImageData() {
            let image = UIImage(data: imageData)
            switch self.mode {
            case .Edit:
                self.setImage(image, for: .normal)
            case .NoAction:
                self.setImage(image, for: .disabled)
            }
        } else {
            let defaultImage = UIImage(named: "defaultProfileImage")
            switch self.mode {
            case .Edit:
                self.setImage(defaultImage, for: .normal)
            case .NoAction:
                self.setImage(defaultImage, for: .disabled)
            }
        }
    }
    
    func didSelectImage(image: UIImage) {
        ApplicationSettings.saveImage(img: image)
    }
    
    @objc private func editHandler() {
        viewController?.present(self.imagePicker, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension UIApplication {
    
}

extension ProfileImageButton: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let i = info[.editedImage] as? UIImage {
            didSelectImage(image: i)
            NotificationCenter.default.post(name: NSNotification.Name("update.profile.img"), object: nil)
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
