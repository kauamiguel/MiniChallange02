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
    var historyVm = HistoryViewModel()
    var appointmentsInfo: ConsultEntity
    
    
    //Variable to know wich treemester is, then we can track this consult after
    
    
    var cells: [CellInfo] = []
    
    private var vm = MaternityCardViewModel()
    
    init(appointmentsInfo: ConsultEntity){
        self.appointmentsInfo = appointmentsInfo
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
        
        configureView()
        
        
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
        }
    }
    
    func configureView(){
        let pacient = historyVm.getPatient()
        
        addViews(viewType: RoutineDataView.self, viewSize: routineData.routineDataViewSize, viewID: RoutineDataView.id, viewQuery: routineData.query)
        
        if appointmentsInfo.tremesteer == 1 && appointmentsInfo.consultId == 1{
            
            
            //Set the data of familyAntecedents
            familyAntecedentView.sections[AppointmentsKeys.hipertensao.rawValue]?.checked = pacient?.familyBG?.hypertension ?? false
            familyAntecedentView.sections[AppointmentsKeys.diabetes.rawValue]?.checked = pacient?.familyBG?.diabetes ?? false
            familyAntecedentView.sections[AppointmentsKeys.cardiopatia.rawValue]?.checked = pacient?.familyBG?.heartCondition ?? false
            familyAntecedentView.sections[AppointmentsKeys.outro.rawValue]?.checked = pacient?.familyBG?.urinaryInfection ?? false
            
            //Adding the view familyAntecedent
            addViews(viewType: FamilyAntecedentView.self, viewSize: familyAntecedentView.familyAntecedentViewSize, viewID: FamilyAntecedentView.id, viewQuery: familyAntecedentView.query)
            
            
           
            
            //Assign the values of preganancyType
            pregnancyTypeView.section[AppointmentsKeys.gemelar.rawValue]?.checked = appointmentsInfo.pregnancyClassification?.twinPregnancy ?? false
            pregnancyTypeView.section[AppointmentsKeys.triplaOuMais.rawValue]?.checked = appointmentsInfo.pregnancyClassification?.tripletsOrMorePregnancy ?? false
            pregnancyTypeView.section[AppointmentsKeys.ignorada.rawValue]?.checked = appointmentsInfo.pregnancyClassification?.ignored ?? false
            pregnancyTypeView.section[AppointmentsKeys.unica.rawValue]?.checked = appointmentsInfo.pregnancyClassification?.singlePregnancy ?? false
            
            //Assign the view preganancyType
            addViews(viewType: PregnancyTypeView.self, viewSize: pregnancyTypeView.pregnancyTypeViewSize, viewID: PregnancyTypeView.id, viewQuery: pregnancyRiskView.query)
            
            
            
            //Assign values of pregnancyRisk
            pregnancyRiskView.section[AppointmentsKeys.riscoHabitual.rawValue]?.checked = appointmentsInfo.pregnancyRisk?.lowRiskPregnancy ?? false
            pregnancyRiskView.section[AppointmentsKeys.altoRisco.rawValue]?.checked = appointmentsInfo.pregnancyRisk?.highRiskPregnancy ?? false
            
            //Assign influenza view
            addViews(viewType: H1N1View.self, viewSize: h1N1View.h1N1ViewSize, viewID: H1N1View.id, viewQuery: h1N1View.query)
            
        
            
            //Assign the values of plannedView
            plannedView.plannedCheckYES.checked = appointmentsInfo.pregnancyPlanning?.plannedPregnancy ?? false
            
            //Assign the plannedView
            addViews(viewType: PlannedView.self, viewSize: plannedView.pregnancyRiskViewSize, viewID: PlannedView.id, viewQuery: plannedView.query)
            
        
            
            //Assign values of clinicalAntecedents
            clinicAntecedentsView.sections[AppointmentsKeys.urinary.rawValue]?.checked = pacient?.personalBG?.urinaryInfection ?? false
            clinicAntecedentsView.sections[AppointmentsKeys.hipertensao.rawValue]?.checked  = pacient?.personalBG?.hypertension ?? false
            clinicAntecedentsView.sections[AppointmentsKeys.fuma.rawValue]?.checked = pacient?.personalBG?.tabagism ?? false
            clinicAntecedentsView.sections[AppointmentsKeys.cardiopatia.rawValue]?.checked = pacient?.personalBG?.heartCondition ?? false
            clinicAntecedentsView.sections[AppointmentsKeys.diabetes.rawValue]?.checked = pacient?.personalBG?.diabetes ?? false
            
            //Assigng clinical antecendentsView
            addViews(viewType: ClinicAntecedentsView.self, viewSize: clinicAntecedentsView.clinicAntecedentsViewSize, viewID: ClinicAntecedentsView.id, viewQuery: clinicAntecedentsView.query)
            
            
            //Add vaccines view
            if let vaccines = pacient!.vaccines{
                
                //Assign data antitetanic
                let antitetanic = historyVm.coreDataMaanger.getAntitetanic()
                tetanicView.yesCheckYES.checked = antitetanic.first?.isVaccined ?? false
                
                //Assign View Antitetanic
                addViews(viewType: TetanicView.self, viewSize: tetanicView.tetanicViewSize, viewID: TetanicView.id, viewQuery: tetanicView.query)
                
                
                //Assign hepatite data
                let hepatite = historyVm.coreDataMaanger.getHepatite()
                hepatitisBView.hepatitisBYesCheckYES.checked = hepatite.first?.isVaccined ?? false
                
                //Assign View Hepatite
                addViews(viewType: HepatitisBView.self, viewSize: hepatitisBView.hepatitisBViewSize, viewID: HepatitisBView.id, viewQuery: hepatitisBView.query)
                
                
                
                //Assign influenza data
                let influenza = historyVm.coreDataMaanger.getInfluenza()
                h1N1View.h1N1YesCheckYES.checked = influenza?.isVaccined ?? false
                
                //Assign influenza view
                addViews(viewType: H1N1View.self, viewSize: h1N1View.h1N1ViewSize, viewID: H1N1View.id, viewQuery: h1N1View.query)
            }
            
            
            
            // FIX ME : Adicionar o exame de sangue e ultrason na tela
            if let blood = appointmentsInfo.bloodExam{
                addViews(viewType: BloodView.self, viewSize: bloodView.bloodViewViewSize, viewID: BloodView.id, viewQuery: bloodView.query)
                addViews(viewType: BloodView2.self, viewSize: bloodView2.bloodView2size, viewID: BloodView2.id, viewQuery: bloodView2.query)
            }
            
            if let ultrasound = appointmentsInfo.ultraSound{
                addViews(viewType: UltrasoundView.self, viewSize: ultrasoundView.ultrasoundSize, viewID: UltrasoundView.id, viewQuery: ultrasoundView.query)
            }
        }else{
            if let blood = appointmentsInfo.bloodExam{
                addViews(viewType: BloodView.self, viewSize: bloodView.bloodViewViewSize, viewID: BloodView.id, viewQuery: bloodView.query)
                addViews(viewType: BloodView2.self, viewSize: bloodView2.bloodView2size, viewID: BloodView2.id, viewQuery: bloodView2.query)
            }
            
            if let ultrasound = appointmentsInfo.ultraSound{
                addViews(viewType: UltrasoundView.self, viewSize: ultrasoundView.ultrasoundSize, viewID: UltrasoundView.id, viewQuery: ultrasoundView.query)
            }
            
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
