//
//  currentDataViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class RecurrentDataViewController: UICollectionViewController, UISearchBarDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    private lazy var defaultView = DefaultView()
    private lazy var routineData =  RoutineDataView()
    private lazy var pregnancyRiskView = PregnancyRiskView()
    private lazy var plannedView = PlannedView()
    private lazy var pregnancyTypeView = PregnancyTypeView()
    private lazy var familyAntecedentView = FamilyAntecedentView()
    private lazy var currentGestationView = CurrentGestationView()
    private lazy var clinicAntecedentsView = ClinicAntecedentsView()
    private lazy var bloodView = BloodView()
    private lazy var ultrasoundView = UltrasoundView()
    var recurrentView : RecurrentDataView = RecurrentDataView()
    var cells : [CellInfo] = []
    var filteredCell = [CellInfo]()
    var searchBar : UISearchBar?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
        
        //Append each view to the cell
        cells = [
            CellInfo(view: defaultView, size: defaultView.defaultViewSize, id: DefaultView.id, className: defaultView.nameOfClass),
            CellInfo(view: bloodView, size: bloodView.bloodViewViewSize, id: BloodView.id, className: bloodView.nameOfClass),
            CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id, className: plannedView.nameOfClass)
        ]
        
        //Set the searchBar created in the view as my searchBar to respond some methods
        self.searchBar = recurrentView.searchBar
        self.searchBar?.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.filteredCell = cells
        recurrentView.setupView(vc: self, collection: self.collectionView)
        setupCollectionView()
    }
    
    //Setup each cell in the collection
    func setupCollectionView(){
        cells.forEach { collectionView.register(MaternityCardCell.self, forCellWithReuseIdentifier: $0.id) }
        collectionView.reloadData()
    }
    
    // how many cell will be
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCell.count
    }
    
    //call the function and create the cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filteredCell[indexPath.row].id, for: indexPath) as? MaternityCardCell else { return UICollectionViewCell() }
        cell.setUpcell(view: filteredCell[indexPath.row].view)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cells[indexPath.row].size
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCell = []
        
        if searchText == ""{
            filteredCell = cells
        }else{
            for obeject in cells{
                if let className = obeject.className, className.lowercased().localizedStandardContains(searchText){
                    filteredCell.append(obeject)
                }
            }
        }
        
        self.collectionView.reloadData()
    }
    
}
