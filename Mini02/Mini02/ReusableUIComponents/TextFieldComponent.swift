//
//  TextFieldComponent.swift
//  Mini02
//
//  Created by Gabriel Eirado on 09/03/24.
//

import UIKit

class TextViewComponet: UITextView, UITextViewDelegate {
   
    let placeholderText = "Digite suas notas aqui"
    var isPlaceholderShown = true
    var typedText: String?
    
    func setupTextView(){
        
        
        self.backgroundColor = .clear
        self.returnKeyType = .done
        self.autocapitalizationType = .sentences
        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = false
        self.autocorrectionType = .default
        
        let bodyFont = UIFont.preferredFont(forTextStyle: .body)
        let scaledFontSize = bodyFont.pointSize * 1.1
        let signikaBoldFont = UIFont(name: "Signika-Bold", size: scaledFontSize)
        
        self.font = signikaBoldFont
        
        self.delegate = self
        
        
        self.delegate = self
        if typedText != nil {
            isPlaceholderShown = false
        }
        self.text = typedText ?? placeholderText
        self.textColor = .lightGray

       
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if isPlaceholderShown {
            textView.text = nil
            textView.textColor = UIColor.darkPink()
            isPlaceholderShown = false
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
            isPlaceholderShown = true
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        typedText = textView.text // Update typedText property when text changes
    }
    
    func getTypedText() -> String? {
        return typedText // Function to return the typed text
    }
}

