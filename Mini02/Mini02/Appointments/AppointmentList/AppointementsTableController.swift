//
//  AppointementsListVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 18/09/23.
//

import UIKit

struct consulta{
    let numero: String
    let data: Date
}

class AppointementsListVC: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var AppointementListViewManager: UITableView? //THE TABLE THAT THIS CONTROLLER MANAGES
    var parentVC:UIViewController? // THE VIEW CONTROLLER THAT CONTAINS THIS CONTROLLER
    
    //DUMMY DATA TO POPULATE THE ROWS AND NEXT SCENE
    var appointmentsData: [consulta] = [
        consulta(numero: "Consulta 1", data: Date()),
        consulta(numero: "Consulta 2", data: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
        consulta(numero: "Consulta 3", data: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
        consulta(numero: "Consulta 4", data: Calendar.current.date(byAdding: .day, value: 3, to: Date())!),
        consulta(numero: "Consulta 5", data: Calendar.current.date(byAdding: .day, value: 4, to: Date())!)
    ]
    
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
        
        // Get the data for the current row based on indexPath.row
        let rowData = appointmentsData[indexPath.row]

        // Configure the cell with the data
        cell.configure(with: rowData)
        
        
        //draws top separator of row
        let topSeparator = UIView(frame: CGRect(x: 0, y: 0, width: cell.frame.width , height: 2))
        topSeparator.backgroundColor = UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1)
        
        //draws bottom separator of row
        let bottomSeparator = UIView(frame: CGRect(x: 0, y: cell.frame.size.height, width: cell.frame.width , height: 2))
        bottomSeparator.backgroundColor =  UIColor(red: 0.70, green: 0.82, blue: 0.84, alpha: 1)
        
        // Set separator for all cells except the first one
        if indexPath.row == 0 {
            cell.contentView.addSubview(topSeparator)
            cell.contentView.addSubview(bottomSeparator)

        } else{
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
    }
    
    //MARK: SET ACTION THAT OCCUR WHEN CLICKING ON A CELL
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        //Checks if theres a parent view controller
        guard let parent = parentVC else{
            fatalError("No view controller to be called")
        }
        
        let view = HistoryVC()
        
        //Gets the data related to that row
        view.appointmentsInfo = appointmentsData[indexPath.row]
        //Pushes the new view
        parent.navigationController?.pushViewController(view, animated: true)
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

  
    
}
