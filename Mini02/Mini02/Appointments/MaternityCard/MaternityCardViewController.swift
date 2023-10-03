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
            CellInfo(view: routineData, size: routineData.routineDataViewSize, id: RoutineDataView.id),
            CellInfo(view: familyAntecedentView, size: familyAntecedentView.familyAntecedentViewSize, id: FamilyAntecedentView.id),
            CellInfo(view: pregnancyTypeView, size: pregnancyTypeView.pregnancyTypeViewSize, id: PregnancyTypeView.id),
            CellInfo(view: pregnancyRiskView, size: pregnancyRiskView.pregnancyRiskViewSize, id: PregnancyRiskView.id),
            CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id),
            CellInfo(view: currentGestationView, size: currentGestationView.currentGestationViewSize, id: CurrentGestationView.id),
            CellInfo(view: clinicAntecedentsView, size: clinicAntecedentsView.clinicAntecedentsViewSize, id: ClinicAntecedentsView.id)
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
        
    }
    
    //register the cell to the indentifiers
    func setupCollectionView(){
        
        cells.forEach { collectionView.register(MaternityCardCell.self, forCellWithReuseIdentifier: $0.id) }
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.id)
        collectionView.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCell.id)
        
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
        
        cell.onDeleteButtonTapped = { [weak self] in
            self?.deleteButtonTapped(cell: cell)
        }
        cell.isEditModeActive = isEditModeActive
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cells[indexPath.row].size
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
       
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.id, for: indexPath) as! HeaderCell
            headerView.tapEditButtonClosure = { [weak self] in
                self?.editButtonTapped(headerView.editButton)
            }
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCell.id, for: indexPath) as! FooterCell
            
            footerView.tapAddViews = { [weak self] in
                self?.openModal()
            }
            
            return footerView
            
        default:
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Return the desired size for the header
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.17)
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        // Return the desired size for the footer
        CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.25)
    }
  
    // move items
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        collectionView.performBatchUpdates({
            // Move the cell in the cells array
            let movedItem = cells.remove(at: sourceIndexPath.row)
            cells.insert(movedItem, at: destinationIndexPath.row)
        }, completion: { [weak self] _ in
            // Reload data to reflect the new order
            self?.collectionView.reloadData()
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
    
    var isEditModeActive = false
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        isEditModeActive.toggle()
        collectionView.reloadData() // Reload the collection view to reflect the changes.
    }

    
    
    
    // generic to add views
    func addViews<T: UIView>(viewType: T.Type, viewSize: CGSize, viewID: String) {
        if !cells.contains(where: { type(of: $0.view) == viewType }) {
            let newView = viewType.init()
            let newCellInfo = CellInfo(view: newView, size: viewSize, id: viewID)
            cells.append(newCellInfo)
            
            self.collectionView.reloadData()
            setupCollectionView()
            
            let lastItemIndexPath = IndexPath(item: cells.count - 1, section: 0)
            collectionView.scrollToItem(at: lastItemIndexPath, at: .bottom, animated: true)
        }
    }
    
    @objc func addNewDefaultViewCell() {
        addViews(viewType: PregnancyRiskView.self, viewSize: pregnancyRiskView.pregnancyRiskViewSize, viewID: PregnancyRiskView.id)
        addViews(viewType: FamilyAntecedentView.self, viewSize: familyAntecedentView.familyAntecedentViewSize, viewID: FamilyAntecedentView.id)
        addViews(viewType: PregnancyTypeView.self, viewSize: pregnancyTypeView.pregnancyTypeViewSize, viewID: PregnancyTypeView.id)
        // Add more view types as needed
    }
    
    @objc func addNewBloodViewCell() {
        addViews(viewType: BloodView.self, viewSize: bloodView.bloodViewViewSize, viewID: BloodView.id)
    }
    
    @objc func addNewUltrassonViewCell() {
        addViews(viewType: UltrasoundView.self, viewSize: ultrasoundView.ultrasoundViewSize, viewID: UltrasoundView.id)
    }
    
    func deleteButtonTapped(cell: MaternityCardCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            // Remove the cell from your data source
            cells.remove(at: indexPath.row)
            
            UIView.animate(withDuration: 0.19, animations: {
                cell.alpha = 0.0
            }) { (_) in
                // After the animation completes, delete the cell from the collection view
                self.collectionView.deleteItems(at: [indexPath])
            }
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
