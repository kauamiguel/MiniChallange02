//
//  DataPickerComponent.swift
//  Mini02
//
//  Created by Gabriel Eirado on 11/10/23.
//


import UIKit

import UIKit

class DatePickerComponent: UIDatePicker {
    
    var selectedDate: Date = Date() // Property to store the selected date


    private func setUpDatePicker() {
        self.datePickerMode = .date
        self.preferredDatePickerStyle = .automatic
      
        self.backgroundColor = UIColor(red: 178/255, green: 208/255, blue: 214/255, alpha: 1)
        self.layer.cornerRadius = 18
        self.clipsToBounds = true
        self.tintColor = UIColor(red: 58/255, green: 166/255, blue: 185/255, alpha: 1)

        // Add a target to detect value changes
        addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }

    @objc private func dateChanged() {
        // Update the selectedDate property when the date picker value changes
        selectedDate = self.date
        print(selectedDate)
        print("aa")
    }
}

