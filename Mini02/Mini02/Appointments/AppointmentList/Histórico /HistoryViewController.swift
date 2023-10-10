//
//  HistoryVC.swift
//  Mini02
//
//  Created by Daniel Ishida on 28/09/23.
//

import UIKit

//class HistoryViewController: UIViewController {
//    
//    //Variable with the info of the current consult
//    var appointmentsInfo: ConsultEntity?
//    
//    let testview: UIView = {
//        let view = UIView()
//        view.backgroundColor = .black
//        return view
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let newView = HistoryView()
//        let dateFormatter = DateFormatter()
//        
//        newView.controller = self
//        dateFormatter.dateFormat = "dd/MM/yy"
//        if let date = appointmentsInfo?.date{
//            newView.dateLabel.text = dateFormatter.string(from: date)
//        }
//        
//        newView.titleLabel.text = "Informacoes da consulta \(appointmentsInfo!.consultId)"
//        
//        
//        newView.setupView()
//        
//        testview.anchorWithConstantValues(top: self.view.topAnchor, width: 200, height: 200)
//     
//    }
//}

//
//  AntenatalViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//


class HistoryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    
    private lazy var routineData =  RoutineDataView()
    private lazy var pregnancyRiskView = PregnancyRiskView()
    private lazy var plannedView = PlannedView()
    private lazy var pregnancyTypeView = PregnancyTypeView()
    private lazy var familyAntecedentView = FamilyAntecedentView()
    private lazy var currentGestationView = CurrentGestationView()
    private lazy var clinicAntecedentsView = ClinicAntecedentsView()
    private lazy var bloodView = BloodView()
    private lazy var bloodView2 = BloodView2()
    private lazy var tetanicView = TetanicView()
    private lazy var hepatitisBView = HepatitisBView()
    private lazy var  h1N1View = H1N1View()
    private lazy var ultrasoundView = UltrasoundView()
    private lazy var maternityVM = MaternityCardViewModel()
    
    //Variable to know wich treemester is, then we can track this consult after
    var treemester : Int?
    
    var cells: [CellInfo] = []
    
    private var vm = MaternityCardViewModel()
    
    init(treemester : Int){
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
        self.treemester = treemester
        
        cells = [
            CellInfo(view: routineData, size: routineData.routineDataViewSize, id: RoutineDataView.id, query: routineData.query),
            CellInfo(view: familyAntecedentView, size: familyAntecedentView.familyAntecedentViewSize, id: FamilyAntecedentView.id, query: familyAntecedentView.query),
            CellInfo(view: pregnancyTypeView, size: pregnancyTypeView.pregnancyTypeViewSize, id: PregnancyTypeView.id, query: pregnancyRiskView.query),
            CellInfo(view: pregnancyRiskView, size: pregnancyRiskView.pregnancyRiskViewSize, id: PregnancyRiskView.id, query: pregnancyRiskView.query),
            CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id, query: plannedView.query),
            CellInfo(view: currentGestationView, size: currentGestationView.currentGestationViewSize, id: CurrentGestationView.id, query: currentGestationView.query),
            CellInfo(view: clinicAntecedentsView, size: clinicAntecedentsView.clinicAntecedentsViewSize, id: ClinicAntecedentsView.id, query: clinicAntecedentsView.query)
        ]
        

        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    override func viewDidLoad() {
        print(maternityVM.createConsultID(treemesterNumber: self.treemester!))
        
        setupCollectionView()
        collectionView.isEditing = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: .done, target: self, action: #selector(backToView))
        
        collectionView.backgroundColor = UIColor(red: 1.00, green: 0.96, blue: 0.96, alpha: 1.00)
        
        self.hidesBottomBarWhenPushed = true
        
    }
    
    //Function of backButton
    @objc func backToView(){
        self.navigationController?.popViewController(animated: true)
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
       
        let zPosition = CGFloat(cells.count - indexPath.row)
            cell.layer.zPosition = zPosition
                
        collectionView.addSubview(cell)
        
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
            
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Return the desired size for the header
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.17)
    }
        
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }

    
    var isEditModeActive = false
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        isEditModeActive.toggle()
        collectionView.reloadData() // Reload the collection view to reflect the changes.
    }
    
    // generic to add views
    func addViews<T: UIView>(viewType: T.Type, viewSize: CGSize, viewID: String, viewQuery: String) {
        if !cells.contains(where: { type(of: $0.view) == viewType }) {
            let newView = viewType.init()
            let newCellInfo = CellInfo(view: newView, size: viewSize, id: viewID, query: viewQuery)
            cells.append(newCellInfo)
            
            self.collectionView.reloadData()
            setupCollectionView()
            
            let lastItemIndexPath = IndexPath(item: cells.count - 1, section: 0)
            collectionView.scrollToItem(at: lastItemIndexPath, at: .bottom, animated: true)
        }
    }
    
    @objc func addNewDefaultViewCell(){
        addViews(viewType: RoutineDataView.self, viewSize: routineData.routineDataViewSize, viewID: RoutineDataView.id, viewQuery: routineData.query)
        addViews(viewType: FamilyAntecedentView.self, viewSize: familyAntecedentView.familyAntecedentViewSize, viewID: FamilyAntecedentView.id, viewQuery: familyAntecedentView.query)
        addViews(viewType: PregnancyTypeView.self, viewSize: pregnancyTypeView.pregnancyTypeViewSize, viewID: PregnancyTypeView.id, viewQuery: pregnancyRiskView.query)
        addViews(viewType: PregnancyRiskView.self, viewSize: pregnancyRiskView.pregnancyRiskViewSize, viewID: PregnancyRiskView.id, viewQuery: pregnancyRiskView.query)
        addViews(viewType: PlannedView.self, viewSize: plannedView.pregnancyRiskViewSize, viewID: PlannedView.id, viewQuery: plannedView.query)
        addViews(viewType: CurrentGestationView.self, viewSize: currentGestationView.currentGestationViewSize, viewID: CurrentGestationView.id, viewQuery: currentGestationView.query)
        addViews(viewType: ClinicAntecedentsView.self, viewSize: clinicAntecedentsView.clinicAntecedentsViewSize, viewID: ClinicAntecedentsView.id, viewQuery: clinicAntecedentsView.query)
        
        // Add more view types as needed
    }
    
    @objc func addNewBloodViewCell(){
        addViews(viewType: BloodView.self, viewSize: bloodView.bloodViewViewSize, viewID: BloodView.id, viewQuery: bloodView.query)
        addViews(viewType: BloodView2.self, viewSize: bloodView2.bloodView2size, viewID: BloodView2.id, viewQuery: bloodView2.query)
    }
    
    @objc func addNewVaccineViewCell(){
        addViews(viewType: TetanicView.self, viewSize: tetanicView.tetanicViewSize, viewID: TetanicView.id, viewQuery: tetanicView.query)
        addViews(viewType: HepatitisBView.self, viewSize: hepatitisBView.hepatitisBViewSize, viewID: HepatitisBView.id, viewQuery: hepatitisBView.query)
        addViews(viewType: H1N1View.self, viewSize: h1N1View.h1N1ViewSize, viewID: H1N1View.id, viewQuery: h1N1View.query)
    }
    
    @objc func addNewUltrassonViewCell() {
        addViews(viewType: UltrasoundView.self, viewSize: ultrasoundView.ultrasoundSize, viewID: UltrasoundView.id, viewQuery: ultrasoundView.query)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
