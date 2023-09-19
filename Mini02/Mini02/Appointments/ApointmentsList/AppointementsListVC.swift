//
//  AppointementsListVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 18/09/23.
//

import UIKit

class AppointementsListVC: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var AppointementListViewManager:AppointmentListView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = AppointementListViewManager?.dequeueReusableCell(withIdentifier:  AppointmentListCell.identifier, for: indexPath) as? AppointmentListCell else{
            fatalError("The consequences of XGH")
        }
        
        cell.textLabel?.text = indexPath.row.description
        
        return cell
    }
    
    override func viewDidLoad() {
        //AppointementListViewManager?.setUpListView(vc: self)
        AppointementListViewManager?.setupList(vc: self)
    }
    
}
