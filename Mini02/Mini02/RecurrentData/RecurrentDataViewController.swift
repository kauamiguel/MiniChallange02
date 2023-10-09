//
//  currentDataViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class RecurrentDataViewController: UICollectionViewController, UISearchBarDelegate, UICollectionViewDelegateFlowLayout {

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
    private var lastConsult : ConsultEntity?
    private var recurrentDataVM = RecurrenteDataViewModel()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
        
        
        //Append each view to the cell
        cells = [
            CellInfo(view: bloodView, size: bloodView.bloodViewViewSize, id: BloodView.id, query: bloodView.query),
            CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id, query: plannedView.query)
        ]
        
        //Set the searchBar created in the view as my searchBar to respond some methods
        self.searchBar = recurrentView.searchBar
        self.searchBar?.delegate = self
        self.navigationItem.hidesSearchBarWhenScrolling = true
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
        
        //Gesture to dismiss the keyboard when click on any view in the screen
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        self.view.endEditing(true)
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
        cell.setUpcellDataView(view: filteredCell[indexPath.row].view)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cells[indexPath.row].size
    }
    
    //Create a search bar that filter the content of my cells
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCell = []
        
        if searchText == ""{
            filteredCell = cells
        }else{
            for obeject in cells{
                if let className = obeject.query, className.lowercased().localizedStandardContains(searchText){
                    filteredCell.append(obeject)
                }
            }
        }
        self.collectionView.reloadData()
    }
    
}
