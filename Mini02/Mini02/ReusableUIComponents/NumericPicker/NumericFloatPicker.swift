//
//  NumericFloatPicker.swift
//  Mini02
//
//  Created by Fabio Freitas on 11/10/23.
//

import UIKit

class NumericFloatPicker: UIPickerView {
    var numberOptions = [Float]()
    var selectedValue: Float = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNumericPicker(from: Float, to: Float, interval: Float = 0.1, startValue: Float? = nil) {
        numberOptions = generateNumbersBetween(from, to, interval)
        tintColor = .white
        backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
        layer.cornerRadius = 8
        delegate = self
        dataSource = self
        if let startValue {
            guard numberOptions.contains(startValue), let index = numberOptions.firstIndex(where: { $0 == startValue})
            else {
                print("Invalid start number for picker: \(startValue)")
                return
            }
            selectedValue = startValue
            selectRow(index, inComponent: 0, animated: false)
        }
    }
    
    func getPickerValue() -> Float {
        selectedValue
    }
    
    
    
    private func generateNumbersBetween(_ start: Float, _ end: Float, _ interval: Float) -> [Float] {
        if start == end || start > end || interval <= 0 {
            return []
        }
        var result = [Float]()
        result.append(start)
        var number = start + interval
        while number <= end {
            result.append(number)
            number += interval
        }
        return result
    }

}

extension NumericFloatPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        numberOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedValue = numberOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerView.subviews.forEach { $0.backgroundColor = .clear }
        
        let label = UILabel()
        label.font = UIFont(name: "Signika-Regular", size: 18)
        let value = numberOptions[row]
        label.text = String(format: "%.1f", value)
        label.textAlignment = .center
        return label
    }
}

