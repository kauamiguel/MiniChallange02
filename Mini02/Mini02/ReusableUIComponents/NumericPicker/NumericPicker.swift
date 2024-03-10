//
//  NumericPicker.swift
//  Mini02
//
//  Created by Fabio Freitas on 10/10/23.
//

import UIKit

class NumericPicker: UITextField {
    var numberOptions = [Int]()
    var selectedValue = 0
    var title: String?
    
    private var picker = UIPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPickerValue(to: Int) {
        guard let idx = numberOptions.firstIndex(where: { $0 == to}) else { return }
        selectedValue = numberOptions[idx]
        text = String(selectedValue)
    }
    
    func setupNumericPicker(from: Int, to: Int, interval: Int = 1, startValue: Int? = nil) {
        numberOptions = generateNumbersBetween(from, to, interval)
        tintColor = UIColor.darkPink()
        backgroundColor = UIColor.lightPink()
        layer.cornerRadius = 8
        picker.delegate = self
        picker.dataSource = self
        let font = UIFont(name: "Signika-Regular", size: 18)
        adjustsFontForContentSizeCategory = true
        self.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font ?? .preferredFont(forTextStyle: .headline))
        textAlignment = .center
        textColor = UIColor.darkPink()
        inputView = picker
        picker.backgroundColor = UIColor.lightPink().withAlphaComponent(0.9)
        if let startValue {
            guard numberOptions.contains(startValue)
            else {
                print("Invalid start number for picker: \(startValue)")
                return
            }

            selectedValue = startValue
        }
    }
    
    func getPickerValue() -> Int {
        return selectedValue
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
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        let font = UIFont(name: "Signika-Regular", size: 24)
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: font ?? .preferredFont(forTextStyle: .headline))
        label.textColor = UIColor.darkPink()
        if UIDevice.current.userInterfaceIdiom == .phone {
            label.maximumContentSizeCategory = .extraExtraExtraLarge
        }
        label.text = String(numberOptions[row])
        label.textAlignment = .center
        return label
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedValue = numberOptions[row]
        text = "\(numberOptions[row])"
        self.resignFirstResponder()
    }
}
