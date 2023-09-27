//
//  PregnantDataViewController+UIImagePickerControllerDelegate.swift
//  Mini02
//
//  Created by Fabio Freitas on 27/09/23.
//

import Foundation
import UIKit

extension PregnantDataViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let i = info[.editedImage] as? UIImage {
            didSelectImage(image: i)
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
