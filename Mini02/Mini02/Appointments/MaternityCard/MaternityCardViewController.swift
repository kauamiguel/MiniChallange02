//
//  AntenatalViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
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
    
    var cells: [CellInfo] = []
    
    private var vm = MaternityCardViewModel()
    
    init(){
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
        
        cells = [
//            CellInfo(view: routineData, size: routineData.routineDataViewSize, id: RoutineDataView.id),
//            CellInfo(view: familyAntecedentView, size: familyAntecedentView.familyAntecedentViewSize, id: FamilyAntecedentView.id),
//            CellInfo(view: pregnancyTypeView, size: pregnancyTypeView.pregnancyTypeViewSize, id: PregnancyTypeView.id),
//            CellInfo(view: pregnancyRiskView, size: pregnancyRiskView.pregnancyRiskViewSize, id: PregnancyRiskView.id),
//            CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id),
//            CellInfo(view: currentGestationView, size: currentGestationView.currentGestationViewSize, id: CurrentGestationView.id),
//            CellInfo(view: clinicAntecedentsView, size: clinicAntecedentsView.clinicAntecedentsViewSize, id: ClinicAntecedentsView.id)
        ]
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        
    }
    
    override func viewDidLoad() {
        
        setupCollectionView()
        collectionView.isEditing = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: .done, target: self, action: #selector(backToView))
        
        
        collectionView.backgroundColor = UIColor(red: 1.00, green: 0.96, blue: 0.96, alpha: 1.00)
        
        self.hidesBottomBarWhenPushed = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(openModal))
        
    }
    
    //register the cell to the indentifiers
    func setupCollectionView(){
       
        cells.forEach { collectionView.register(MaternityCardCell.self, forCellWithReuseIdentifier: $0.id) }
        collectionView.reloadData()
        
    }
    // how many cell will be
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.count
        
    }
    //call the function and create the cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cells[indexPath.row].id, for: indexPath) as? MaternityCardCell else { return UICollectionViewCell() }
        cell.setUpcell(view: cells[indexPath.row].view)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cells[indexPath.row].size
    }
    // move items
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        collectionView.performBatchUpdates({ // this makes the changes work faster
            // Move the cell
            let movedItem = cells.remove(at: sourceIndexPath.row)
            cells.insert(movedItem, at: destinationIndexPath.row)

        }, completion: { [weak self] _ in
            self?.collectionView.reloadData() // Reload data after updates
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    
    @objc func backToView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //Adicionar dados dinamicamente na celula
    @objc func openModal(){
        let mySheetVC = ModalVC()
        mySheetVC.collectionView = self
        mySheetVC.modalPresentationStyle = .custom
        present(mySheetVC, animated: true, completion: nil)
    }
    
    @objc func addNewDefaultViewCell(defaultView : PregnancyRiskView? = nil) {
        var hasView = false
        
        for object in cells{
            if type(of: object.view) == PregnancyRiskView.self{
                hasView = true
                print("Ja existe esse elemento")
                break
            }
        }
        
        if let _ = defaultView, hasView == false{
            let pregnancyRiskView = PregnancyRiskView()
            let plannedView = PlannedView()
            let pregnancyTypeView = PregnancyTypeView()
            let familyAntecedentView = FamilyAntecedentView()
            let currentGestationView = CurrentGestationView()
            let clinicAntecedentsView = ClinicAntecedentsView()
            
            
            let views: [CellInfo] = [
                CellInfo(view: familyAntecedentView, size: familyAntecedentView.familyAntecedentViewSize, id: FamilyAntecedentView.id),
                CellInfo(view: pregnancyTypeView, size: pregnancyTypeView.pregnancyTypeViewSize, id: PregnancyTypeView.id),
                CellInfo(view: pregnancyRiskView, size: pregnancyRiskView.pregnancyRiskViewSize, id: PregnancyRiskView.id),
                CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id),
                CellInfo(view: currentGestationView, size: currentGestationView.currentGestationViewSize, id: CurrentGestationView.id),
                CellInfo(view: clinicAntecedentsView, size: clinicAntecedentsView.clinicAntecedentsViewSize, id: ClinicAntecedentsView.id)
            ]
            
            for view in views {
                let cellInfo = CellInfo(view: view.view, size: view.size, id: view.id)
                cells.append(cellInfo)
                self.collectionView.reloadData()
            }
            
            setupCollectionView()
            
            let lastItemIndexPath = IndexPath(item: cells.count - 1, section: 0)

            collectionView.scrollToItem(at: lastItemIndexPath, at: .bottom, animated: true)
            
            
        }
        
    }
    
    @objc func addNewBloodViewCell(bloodView : BloodView? = nil) {
        var hasView = false
        
        for object in cells{
            if type(of: object.view) == BloodView.self{
                hasView = true
                print("Ja existe esse elemento")
                break
            }
        }
        
        if let _ = bloodView, hasView == false{
            let newView = BloodView()
            let newCell = CellInfo(view: newView, size: newView.bloodViewViewSize, id: BloodView.id)
            cells.append(newCell)
            setupCollectionView()
            
            let lastItemIndexPath = IndexPath(item: collectionView.numberOfItems(inSection: 0) - 1, section: 0)
            collectionView.scrollToItem(at: lastItemIndexPath, at: .bottom, animated: true)
            
        }
        
    }
    
    @objc func addNewUltrassonViewCell(ultrassonView : UltrasoundView? = nil) {
        var hasView = false
        
        for object in cells{
            if type(of: object.view) == UltrasoundView.self{
                hasView = true
                print("Ja existe esse elemento")
                break
            }
        }
        
        if let _ = ultrassonView, hasView == false{
            let newView = UltrasoundView()
            let newCell = CellInfo(view: newView, size: newView.ultrasoundViewSize, id: BloodView.id)
            cells.append(newCell)
            setupCollectionView()
            let lastItemIndexPath = IndexPath(item: collectionView.numberOfItems(inSection: 0) - 1, section: 0)
            collectionView.scrollToItem(at: lastItemIndexPath, at: .bottom, animated: true)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
