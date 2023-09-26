//
//  DropDownMenuComponent.swift
//  Mini02
//
//  Created by Gabriel Eirado on 25/09/23.
//


import UIKit

class DropDownButton: UIButton, UITableViewDelegate, UITableViewDataSource {
    private var dropDownOptions = [String]()
    private var tableView: UITableView!
    private var heightConstraint: NSLayoutConstraint?
    private var isOpen = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    func setUpButton() {
        self.backgroundColor = UIColor.darkGray
        print("function called")
        tableView = UITableView()
        tableView.backgroundColor = UIColor.darkGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        heightConstraint = tableView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            heightConstraint!,
        ])
        
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        isOpen.toggle()
        tableView.reloadData()
        print("hi")
        
        if isOpen {
            NSLayoutConstraint.deactivate([heightConstraint!])
            if self.dropDownOptions.count > 0 {
                heightConstraint?.constant = CGFloat(self.dropDownOptions.count) * 44.0 // 44.0 is the default row height
            } else {
                heightConstraint?.constant = 0
            }
            NSLayoutConstraint.activate([heightConstraint!])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.superview?.layoutIfNeeded()
            }, completion: nil)
        } else {
            NSLayoutConstraint.deactivate([heightConstraint!])
            heightConstraint?.constant = 0
            NSLayoutConstraint.activate([heightConstraint!])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.superview?.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func setDropDownOptions(_ options: [String]) {
        dropDownOptions = options
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isOpen ? dropDownOptions.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.setTitle(dropDownOptions[indexPath.row], for: .normal)
        isOpen = false
        tableView.reloadData()
        
        NSLayoutConstraint.deactivate([heightConstraint!])
        heightConstraint?.constant = 0
        NSLayoutConstraint.activate([heightConstraint!])
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.superview?.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
