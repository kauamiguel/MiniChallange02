//
//  NumericPicker.swift
//  Mini02
//
//  Created by Fabio Freitas on 10/10/23.
//

import UIKit

class NumericPicker: UIPickerView {
    var numberOptions = [Int]()
    var selectedValue = 0
    var title: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPickerValue(to: Int) {
        guard let idx = numberOptions.firstIndex(where: { $0 == to}) else { return }
        selectedValue = numberOptions[idx]
        selectRow(idx, inComponent: 0, animated: true)
    }
    
    func setupNumericPicker(from: Int, to: Int, interval: Int = 1, startValue: Int? = nil) {
        numberOptions = generateNumbersBetween(from, to, interval)
        tintColor = .white
        backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
        layer.cornerRadius = 8
        delegate = self
        dataSource = self
        subviews.first?.subviews.last?.backgroundColor = .red
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
    
    func getPickerValue() -> Int {
        selectedValue
    }
    
    
    private func generateNumbersBetween(_ start: Int, _ end: Int, _ interval: Int) -> [Int] {
        if start == end || start > end || interval <= 0 {
            return []
        }
        var result = [Int]()
        var number = start + interval
        while number <= end {
            result.append(number)
            number += interval
        }
        
        return result
    }
}

extension NumericPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        numberOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        self.selectedValue = numberOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerView.subviews.forEach { $0.backgroundColor = .clear }
        
        let label = UILabel()
        label.font = UIFont(name: "Signika-Regular", size: 18)
        label.text = String(numberOptions[row])
        label.textAlignment = .center
        return label
    }
}
