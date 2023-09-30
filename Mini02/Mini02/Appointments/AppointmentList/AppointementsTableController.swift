//
//  AppointementsListVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 18/09/23.
//

import UIKit

class AppointementsListVC: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var AppointementListViewManager: UITableView? //THE TABLE THAT THIS CONTROLLER MANAGES
    var parentVC:UIViewController? // THE VIEW CONTROLLER THAT CONTAINS THIS CONTROLLER
    
    
    //MARK: SET THE NUMBER OF ROWS IN THE TABLE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //MARK: DRAWS EACH CELLS ROW ACCORDING TO THE CELL REGISTERED ON THE TABLE
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Gets the cell
        guard let cell = AppointementListViewManager?.dequeueReusableCell(withIdentifier:  AppointmentListCell.identifier, for: indexPath) as? AppointmentListCell else{
            fatalError("The consequences of XGH")
        }
        
        //draws top separator of row
        let topSeparator = UIView(frame: CGRect(x: 0, y: 0, width: cell.frame.width , height: 2))
        topSeparator.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1)
        
        //draws bottom separator of row
        let bottomSeparator = UIView(frame: CGRect(x: 0, y: cell.frame.size.height, width: cell.frame.width , height: 2))
        bottomSeparator.backgroundColor =  UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1)
        
        // Set separator for all cells except the first one
        if indexPath.row == 0 {
            cell.contentView.addSubview(topSeparator)
        } else{
            cell.contentView.addSubview(topSeparator)
            cell.contentView.addSubview(bottomSeparator)
        }
        
        //Removes the default separator
        tableView.separatorStyle = .none
        
        //Removes background of the cell
        cell.backgroundColor = .clear
        
        return cell
    }
    
    //MARK: SETS HEIGHT OF THE CELL
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UIScreen.main.bounds.height * 0.09
        //or whatever you need
    }
    
    //MARK: SET ACTION THAT OCCUR WHEN CLICKING ON A CELL
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
        guard let parent = parentVC else{
            fatalError("No view controller to be called")
        }
        
        let view = HistoryVC()
        
        parent.navigationController?.pushViewController(view, animated: true)
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

  
    
}
