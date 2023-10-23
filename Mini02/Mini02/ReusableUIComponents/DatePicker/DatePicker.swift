//
//  DatePicker.swift
//  Mini02
//
//  Created by Fabio Freitas on 11/10/23.
//

import UIKit

class DatePicker: UIDatePicker {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDatePicker(defaultDate: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!, round: CGFloat = 18) {
        datePickerMode = .date
        preferredDatePickerStyle = .compact
        calendar = .current
        setDate(defaultDate, animated: false)
        backgroundColor = UIColor(red: 255/255, green: 208/255, blue: 208/255, alpha: 1)
        layer.cornerRadius = round
        clipsToBounds = true
        tintColor = UIColor(red: 255/255, green: 208/255, blue: 208/255, alpha: 1)
    }
}
