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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = AppointementListViewManager?.dequeueReusableCell(withIdentifier:  AppointmentListCell.identifier, for: indexPath) as? AppointmentListCell else{
            fatalError("The consequences of XGH")
        }
        
        self.AppointementListViewManager?.rowHeight = 53
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
        
        
        
        
        
        
        
        
        
    
      tableView.deselectRow(at: indexPath, animated: true)
    }
    
  
    
}
