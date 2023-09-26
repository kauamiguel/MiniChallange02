//
//  PickerComponent.swift
//  Mini02
//
//  Created by Gabriel Eirado on 25/09/23.
//

import Foundation
import UIKit

class PickerComponent: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var pickerData: [String] = []
    
    init(data: [String]) {
        super.init(frame: .zero)
        
        self.pickerData = data
        
        self.delegate = self
        self.dataSource = self
    
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
}



