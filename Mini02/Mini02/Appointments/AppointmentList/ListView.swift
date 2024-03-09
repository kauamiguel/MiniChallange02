//
//  List.swift
//  Mini02
//
//  Created by Daniel Ishida on 20/09/23.
//

import UIKit

class ListView: UIView {
    
    var controller : UIViewController?
    var tableController = AppointementsListViewController()
    
    
    //MARK: Setup View Stack
    func setupView(action: Selector, viewModel : AppointmentsListVM){
        //Initialize elements
        let header = createHeader()
        let list = setupList(viewModel : viewModel)
        let title = setupTitle()
        let btn = AddButton()
        
        //Checks for a view controller
        guard let vc = controller else{
            fatalError("No ViewController was passed to the view")
        }
        
        //UI view settings
        let bgImage = UIImage(named: "backGroundRecurrentData")
        if let image = bgImage {
            vc.view.backgroundColor = UIColor(patternImage: image)
            tableController.view.backgroundColor = UIColor(patternImage: image)
        }
        
        // Add List to the view
        vc.view.addSubview(list)
        //Add elements to the Stack view
        header.addArrangedSubview(title)
        header.addArrangedSubview(btn)

        title.centerY(inView: header)
        btn.centerY(inView: header)
        
        // Cofnigure list constraints
        list.anchorWithConstantValues(
            top: header.bottomAnchor,
            left: vc.view.leadingAnchor,
            right: vc.view.trailingAnchor,
            bottom: vc.view.bottomAnchor,
            topPadding: vc.view.bounds.height * 0.06,
            leftPadding: 21,
            rightPadding: -21
        )
        
        //Sets target for button
        btn.addTarget(vc, action: action, for: .touchUpInside)
    }
    
    //MARK: Title setup function
    func setupTitle() -> UILabel{
        let title = UILabel()
        
        //Title UI settings
        title.text = "Consultas".localized()
        title.font = UIFont(name: "Signika-Bold", size: 30)
        title.textColor = UIColor.darkPink()
       
        return title
    }
    
    //MARK: List setup function
    func setupList(viewModel : AppointmentsListVM) -> UITableView{
        
        let list = UITableView()
        list.sectionHeaderTopPadding = UIScreen.main.bounds.height * 0.075
        
        //Sets the table controller of the list
        tableController.appointementListViewManager = list
        
        //Sets the parent of the table view controller
        tableController.parentVC = controller
        
        //Set the view model as the same of listViewController
        tableController.appointmentVM = viewModel
        
        //UI SETUP
        list.backgroundColor = .clear
        
        //SET THE IDENTIFIER FOR CREATING NEW CELLS ON THIS LIST
        list.register(AppointmentListCell.self, forCellReuseIdentifier: AppointmentListCell.identifier)

        
        //ASSIGN A DELEGATE AND DATA SOURCE OF LIST
        list.delegate =  tableController as any UITableViewDelegate
        list.dataSource = tableController as any UITableViewDataSource
        
        return list
    }
    
    //MARK: Add button setup
    func AddButton() -> UIButton{
        let btn = UIButton()
       
        //UI settings of the button
        btn.contentMode = .scaleAspectFill // Set content mode to scaleAspectFill
        btn.setBackgroundImage(UIImage(systemName: "plus.circle"), for: .normal)
        btn.tintColor = UIColor.darkPink()
        
    
        //This contrainst set the size of the button
        btn.anchorWithConstantValues(width: UIScreen.main.bounds.height * 0.06, height: UIScreen.main.bounds.height * 0.06)
        return btn
    }
    
    //MARK: cretes header -> Title and button
    func createHeader() -> UIStackView{
        let Hstack = UIStackView()
        
        //Check for a controller
        guard let vc = controller else{
            fatalError("No ViewController was passed to the view")
        }
        
        //Adds stack view to controller
        vc.view.addSubview(Hstack)
        
        //Sets View Stack configurations
        Hstack.axis = .horizontal
        Hstack.distribution = .fillProportionally
        Hstack.alignment = .firstBaseline
        
        //Set Stack view constrains
        Hstack.anchorWithConstantValues(
            top: vc.view.topAnchor,
            left: vc.view.leadingAnchor,
            right: vc.view.trailingAnchor,
            topPadding: vc.view.bounds.height * 0.13,
            leftPadding: vc.view.bounds.width * 0.06,
            rightPadding: -vc.view.bounds.width * 0.06
        )
        
        return Hstack
    }
}
