//
//  AppointementsListVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 18/09/23.
//

import UIKit

class AppointementsListVC: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var AppointementListViewManager: UITableView?
    let historyView = HistoryView()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = AppointementListViewManager?.dequeueReusableCell(withIdentifier:  AppointmentListCell.identifier, for: indexPath) as? AppointmentListCell else{
            fatalError("The consequences of XGH")
        }
        
        let topSeparator = UIView(frame: CGRect(x: 0, y: 0, width: cell.frame.width , height: 2))
        topSeparator.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1)
        
        let bottomSeparator = UIView(frame: CGRect(x: 0, y: cell.frame.size.height, width: cell.frame.width , height: 2))
        bottomSeparator.backgroundColor =  UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1)
        
        // Set separator for all cells except the first one
        if indexPath.row == 0 {
            cell.contentView.addSubview(topSeparator)
        } else{
            cell.contentView.addSubview(topSeparator)
            cell.contentView.addSubview(bottomSeparator)
        }
        
        tableView.separatorColor = UIColor(red: 0.70, green: 0.82, blue: 0.84,alpha: 1)
        tableView.separatorStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UIScreen.main.bounds.height * 0.09
        //or whatever you need
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
        
        
        
        
        self.navigationController?.pushViewController(HistoryVC(), animated: true)
        
        
        
        
    
      tableView.deselectRow(at: indexPath, animated: true)
    }

  
    
}
