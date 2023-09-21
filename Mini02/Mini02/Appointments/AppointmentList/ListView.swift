//
//  List.swift
//  Mini02
//
//  Created by Daniel Ishida on 20/09/23.
//

import UIKit

class ListView: UIView {
    
    var controller : UIViewController?
    var tableController = AppointementsListVC()
    
    
    //MARK: Setup View Stack
    func setupView(action: Selector){
        //Initialize elements
        let header = createHeader()
        let list = setupList()
        let title = setupTitle()
        let btn = AddButton()
        
        //Checks for a view controller
        guard let vc = controller else{
            fatalError("No ViewController was passed to the view")
        }
        
        //UI view settings
        vc.view.backgroundColor = .white
        
        // Add List to the view
        vc.view.addSubview(list)
        //Add elements to the Stack view
        header.addArrangedSubview(title)
        header.addArrangedSubview(btn)

        
        // Cofnigure list constraints
        list.anchorWithConstantValues(
            top: header.bottomAnchor,
            left: vc.view.leadingAnchor,
            right: vc.view.trailingAnchor,
            bottom: vc.view.bottomAnchor,
            topPadding: vc.view.bounds.height * 0.02
        )
        
        //Sets target for button
        btn.addTarget(vc, action: action, for: .touchUpInside)
    }
    
    //MARK: Title setup function
    func setupTitle() -> UILabel{
        let title = UILabel()
        
        //Title UI settings
        title.text = "Consultas"
        title.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize, weight: .bold)
    
        return title
    }
    
    //MARK: List setup function
    func setupList() -> UITableView{
        
        let list = UITableView()
        
        //Sets the table controller of the list
        tableController.AppointementListViewManager = list
        
        //UI SETUP
        list.backgroundColor = .systemBackground
        
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
        btn.tintColor = .black
        
    
        //This contrainst set the size of the button
        btn.anchorWithConstantValues(width: 48, height: 48)
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
