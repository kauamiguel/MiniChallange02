//
//  PickerComponent.swift
//  Mini02
//
//  Created by Gabriel Eirado on 25/09/23.
//

import UIKit

class CustomTextFieldWithPicker: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData: [String] = []
    
    private var pickerView: UIPickerView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
   
        pickerView = UIPickerView()
        pickerView?.delegate = self
        pickerView?.dataSource = self
        

        self.inputView = pickerView
 
        self.textAlignment = .center
        self.backgroundColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = pickerData[row]
        self.resignFirstResponder()
    }
    
    override var text: String? {
        didSet {
            self.textAlignment = .center
        }
    }
    
}
