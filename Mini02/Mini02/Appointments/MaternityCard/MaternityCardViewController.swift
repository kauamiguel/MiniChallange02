//
//  AntenatalViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    
    private lazy var routineData =  RoutineDataView()
    private lazy var pregnancyRiskView = PregnancyRiskView()
    private lazy var plannedView = PlannedView()
    private lazy var pregnancyTypeView = PregnancyTypeView()
    private lazy var familyAntecedentView = FamilyAntecedentView()
    private lazy var clinicAntecedentsView = ClinicAntecedentsView()
    private lazy var bloodView = BloodView()
    private lazy var bloodView2 = BloodView2()
    private lazy var tetanicView = TetanicView()
    private lazy var hepatitisBView = HepatitisBView()
    private lazy var h1N1View = H1N1View()
    private lazy var ultrasoundView = UltrasoundView()
    private lazy var maternityVM = MaternityCardViewModel()
    
    //Variable to know wich treemester is, then we can track this consult after
    var treemester: Int?
    var consult: Consulta?
    
    var cells: [CellInfo] = []
    
    private var vm = MaternityCardViewModel()
    
    init(treemester : Int){
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)

        cells = [
            CellInfo(view: routineData, size: routineData.routineDataViewSize, id: RoutineDataView.id, query: routineData.query),
            CellInfo(view: familyAntecedentView, size: familyAntecedentView.familyAntecedentViewSize, id: FamilyAntecedentView.id, query: familyAntecedentView.query),
            CellInfo(view: pregnancyTypeView, size: pregnancyTypeView.pregnancyTypeViewSize, id: PregnancyTypeView.id, query: pregnancyRiskView.query),
            CellInfo(view: pregnancyRiskView, size: pregnancyRiskView.pregnancyRiskViewSize, id: PregnancyRiskView.id, query: pregnancyRiskView.query),
            CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id, query: plannedView.query),
            CellInfo(view: clinicAntecedentsView, size: clinicAntecedentsView.clinicAntecedentsViewSize, id: ClinicAntecedentsView.id, query: clinicAntecedentsView.query)
        ]
 
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.treemester = treemester
        let consultID = maternityVM.createConsultID(treemesterNumber: self.treemester!)
        self.consult = Consulta(consultId: consultID, date: Date(), trimesteer: self.treemester!)
        
    }
    
    override func viewDidLoad() {
        
        setupCollectionView()
        collectionView.isEditing = true
        
        // Create a custom UIButton with an image
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "ChevronBackButton"), for: .normal)
        backButton.addTarget(self, action: #selector(backToView), for: .touchUpInside)
        let customBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = customBackButton
        
        let bgImage = UIImage(named: "backGroundRecurrentData")
        if let image = bgImage{
            self.view.backgroundColor = UIColor(patternImage: image)
            self.collectionView.backgroundColor = UIColor(patternImage: image)
        }
        
        self.hidesBottomBarWhenPushed = true
        
        //Adding the checked box logic
        if plannedView.plannedCheckYES.checked{
            plannedView.plannedCheckNO.checked = false
            plannedView.plannedCheckNO.checked = false
        }else{
            plannedView.plannedCheckYES.checked = false
            plannedView.plannedCheckNO.checked = true
        }
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
        
        cell.onDeleteButtonTapped = { [weak self] in
            self?.deleteButtonTapped(cell: cell)
        }
        
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
            
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCell.id, for: indexPath) as! FooterCell
            
            footerView.tapAddViews = { [weak self] in
                self?.openModal()
            }
            
            footerView.tapSave = { [weak self] in
                self?.saveData()
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
        CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.23)
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
    
    func saveData(){
        print("saved")
         
        //Adding routines
        let ig = Int(routineData.igMenu.selectedOption ?? "0")
        let edema = routineData.edemaMenu.selectedOption
        let fetalHeart = Int(routineData.bcfMenu.selectedOption ?? "0")
        let uterine = Int(routineData.uterineHeightMenu.selectedOption ?? "0")
        let weight = Float(routineData.wheightMenu.selectedOption ?? "0")
        let bloodPressure = routineData.arterialPressureMenu.selectedOption
        
        let routine = RoutineDataModel(bloodPressure: bloodPressure ?? "", edema: edema ?? "", fetalHeartHate: fetalHeart ?? 0, uterineHeight: uterine ?? 0, weightAndBodyMassIndex: weight ?? 0, ig: ig ?? 0)
        self.consult?.routineData = routine
        
        
        //Assign family BackGround
        let hypertension = familyAntecedentView.sections[AppointmentsKeys.hipertensao.rawValue]?.getBooleanValue()
        let diabetes = familyAntecedentView.sections[AppointmentsKeys.diabetes.rawValue]?.getBooleanValue()
        let cardiopatia = familyAntecedentView.sections[AppointmentsKeys.cardiopatia.rawValue]?.getBooleanValue()
        let urinary = familyAntecedentView.sections[AppointmentsKeys.outro.rawValue]?.getBooleanValue()
        
        var familyBg = FamilyBGModel()
        familyBg.heartCondition = hypertension ?? false
        familyBg.diabetes = diabetes ?? false
        familyBg.heartCondition = cardiopatia ?? false
        familyBg.urinaryInfection = urinary ?? false
        
        //Assign pregnancy typeView
        let gemelar = pregnancyTypeView.section[AppointmentsKeys.gemelar.rawValue]?.getBooleanValue()
        let tripla = pregnancyTypeView.section[AppointmentsKeys.triplaOuMais.rawValue]?.getBooleanValue()
        let ignorada = pregnancyTypeView.section[AppointmentsKeys.ignorada.rawValue]?.getBooleanValue()
        let unique = pregnancyTypeView.section[AppointmentsKeys.unica.rawValue]?.getBooleanValue()
        
        let pregnancyType = PregnancyClassificationModel(ignored: ignorada ?? false, singlePregnancy: unique ?? false, tripletsOrMorePregnancy: tripla ?? false, twinPregnancy: gemelar ?? false)
        
        self.consult?.pregnancyClassificationModel = pregnancyType
        
        //Assign risk pregnancy
        let habitualRisk = pregnancyRiskView.section[AppointmentsKeys.riscoHabitual.rawValue]?.getBooleanValue()
        let highRisk = pregnancyRiskView.section[AppointmentsKeys.altoRisco.rawValue]?.getBooleanValue()
        
        let riskPregnancy = PregnancyRiskModel(highRiskPregnancy: highRisk ?? false, lowRiskPregnancy: habitualRisk ?? false)
        
        self.consult?.riskPregnancy = riskPregnancy
        
        //Planned pregnancy
        let pregnancyPlanned = plannedView.plannedCheckYES.getBooleanValue()
        let planned = PregnancyPlanningModel(plannedPregnancy: pregnancyPlanned)
        self.consult?.plannedPregnancy = planned
        
        //Add personal BG
        let inffection = clinicAntecedentsView.sections[AppointmentsKeys.urinary.rawValue]?.getBooleanValue()
        let hypertensionBg = clinicAntecedentsView.sections[AppointmentsKeys.hipertensao.rawValue]?.getBooleanValue()
        let smokeBg = clinicAntecedentsView.sections[AppointmentsKeys.fuma.rawValue]?.getBooleanValue()
        let cardiacBg = clinicAntecedentsView.sections[AppointmentsKeys.cardiopatia.rawValue]?.getBooleanValue()
        let diabetesBg = clinicAntecedentsView.sections[AppointmentsKeys.diabetes.rawValue]?.getBooleanValue()
        
        var personalBg = PersonalBGModel()
        personalBg.diabetes = diabetesBg ?? false
        personalBg.urinaryInfection = inffection ?? false
        personalBg.hypertension = hypertensionBg ?? false
        personalBg.heartCondition = cardiacBg ?? false
        personalBg.tabagism = smokeBg  ?? false
        
        if let addConsult = self.consult{
            maternityVM.createNewConsult(consult: addConsult)
            
            //Add familyBg
            maternityVM.coreDataManager.assignFamilylBG(familyBG: familyBg)
            
            //Add personalBg
            maternityVM.coreDataManager.assignPersonalBG(personalBG: personalBg)
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
