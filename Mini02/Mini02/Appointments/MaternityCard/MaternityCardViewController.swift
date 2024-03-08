//
//  AntenatalViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit
import CoreHaptics

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
    var consultID : Int?
    
    //Variable to know wich treemester is, then we can track this consult after
    var treemester: Int?
    var consult: Consulta?
    
    var cells: [CellInfo] = []
    
    private var vm = MaternityCardViewModel()
    
    init(treemester : Int){
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
        
        checkFirstAppointment()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.treemester = treemester
        self.consultID = maternityVM.createConsultID(treemesterNumber: self.treemester!)
        self.consult = Consulta(consultId: consultID!, date: Date(), trimesteer: self.treemester!)
        
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
        setupDismissKeyboard()
    }
    private func setupDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //Function of backButton
    @objc func backToView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func checkFirstAppointment(){
        if ApplicationSettings.shouldEnterFirstAppointment(){
            self.cells = [
                CellInfo(view: routineData, size: routineData.routineDataViewSize, id: RoutineDataView.id, query: routineData.query),
                CellInfo(view: familyAntecedentView, size: familyAntecedentView.familyAntecedentViewSize, id: FamilyAntecedentView.id, query: familyAntecedentView.query),
                CellInfo(view: pregnancyTypeView, size: pregnancyTypeView.pregnancyTypeViewSize, id: PregnancyTypeView.id, query: pregnancyRiskView.query),
                CellInfo(view: pregnancyRiskView, size: pregnancyRiskView.pregnancyRiskViewSize, id: PregnancyRiskView.id, query: pregnancyRiskView.query),
                CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id, query: plannedView.query),
                CellInfo(view: clinicAntecedentsView, size: clinicAntecedentsView.clinicAntecedentsViewSize, id: ClinicAntecedentsView.id, query: clinicAntecedentsView.query)
            ]
        }else{
            self.cells = [
                CellInfo(view: routineData, size: routineData.routineDataViewSize, id: RoutineDataView.id, query: routineData.query)
            ]
        }
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
    
    private lazy var confirmAlert:  UIAlertController =  {
        let alert = UIAlertController(title: "Tem certeza que deseja salvar consulta?".localized(), message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar".localized(), style: .cancel, handler: nil))
        let saveBtn = UIAlertAction(title: "Salvar".localized(), style: .default, handler: {
            [weak self] _ in
            self?.saveData()
            
            self?.navigationController?.popViewController(animated: true)
        })
        alert.addAction(saveBtn)
        return alert
    }()
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.id, for: indexPath) as! HeaderCell
            
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCell.id, for: indexPath) as! FooterCell
            
            footerView.tapAddViews = { [weak self] in
                self?.openModal()
            }
            
            footerView.tapSave = { [weak self] in
                if let confirm = self?.confirmAlert {
                    self?.present(confirm, animated: true)
                }
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
    
    
    func addNewView(views: [CellInfo]){
        for view in views {
            if !cells.contains(where: { info in
                info.id == view.id
            }){
                cells.append(view)
                setupCollectionView()
                
                let lastItemIndexPath = IndexPath(item: collectionView!.self.numberOfItems(inSection: 0) - 1, section: 0)
                collectionView!.self.scrollToItem(at: lastItemIndexPath, at: .bottom, animated: true)
                
            }
        }
    }
    
    @objc func addNewBloodViewCell(){
        let views: [CellInfo] = [
            CellInfo(view: bloodView, size: bloodView.bloodViewViewSize, id: BloodView.id, query: bloodView.query),
            CellInfo(view: bloodView2, size: bloodView2.bloodView2size, id: BloodView2.id, query: bloodView2.query)
        ]
        
        addNewView(views: views)
        
    }
    
    @objc func addNewVaccineViewCell(){
        
        let views: [CellInfo] = [
            CellInfo(view: tetanicView, size: tetanicView.tetanicViewSize, id: TetanicView.id, query: tetanicView.query),
            CellInfo(view: hepatitisBView, size: hepatitisBView.hepatitisBViewSize, id: HepatitisBView.id, query: hepatitisBView.query),
            CellInfo(view: h1N1View, size: h1N1View.h1N1ViewSize, id: H1N1View.id, query: h1N1View.query)
        ]
        
        addNewView(views: views)
    }
    
    @objc func addNewUltrassonViewCell() {
        let views: [CellInfo] = [
            CellInfo(view: ultrasoundView, size: ultrasoundView.ultrasoundSize, id: UltrasoundView.id, query: ultrasoundView.query),
        ]
        
        addNewView(views: views)
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
        
        //Add hapticis : After will change the place of this code
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        //Adding routines
        let ig = Int(routineData.igMenu.getPickerValue())
        let edema = routineData.edemaMenu.selectedOption
        let fetalHeart = routineData.bcfMenu.selectedOption
        let uterine = Int(routineData.uterineHeightMenu.getPickerValue())
        let weight = routineData.wheightMenu.getPickerValue()
        let bloodPressure = routineData.arterialPressureMenu.text ?? ""
        
        //Mudar o fetalHeart no CoreData para ser string
        let routine = RoutineDataModel(bloodPressure: bloodPressure , edema: edema , fetalHeartHate: 0, uterineHeight: uterine , weightAndBodyMassIndex: weight, ig: ig, bcf: fetalHeart)
        self.consult?.routineData = routine
        
        //Check wheter is first Appointment because some data will be get just there
        if ApplicationSettings.shouldEnterFirstAppointment(){
            
            //Assign family BackGround
            let hypertension = familyAntecedentView.sections[AppointmentsKeys.hipertensao.rawValue]?.getBooleanValue()
            let diabetes = familyAntecedentView.sections[AppointmentsKeys.diabetes.rawValue]?.getBooleanValue()
            let cardiopatia = familyAntecedentView.sections[AppointmentsKeys.cardiopatia.rawValue]?.getBooleanValue()
            let urinary = familyAntecedentView.sections[AppointmentsKeys.outro.rawValue]?.getBooleanValue()
            
            var familyBg = FamilyBGModel()
            familyBg.hypertension = hypertension ?? false
            familyBg.diabetes = diabetes ?? false
            familyBg.heartCondition = cardiopatia ?? false
            familyBg.urinaryInfection = urinary ?? false
            //Add familyBg
            maternityVM.coreDataManager.assignFamilylBG(familyBG: familyBg)
            
            //Assign pregnancy typeView
            let gemelar = pregnancyTypeView.section[AppointmentsKeys.gemelar.rawValue]?.getBooleanValue()
            let tripla = pregnancyTypeView.section[AppointmentsKeys.triplaOuMais.rawValue]?.getBooleanValue()
            let unique = pregnancyTypeView.section[AppointmentsKeys.unica.rawValue]?.getBooleanValue()
            
            let pregnancyType = PregnancyClassificationModel(singlePregnancy: unique ?? false, tripletsOrMorePregnancy: tripla ?? false, twinPregnancy: gemelar ?? false)
            
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
            
            //Add personalBg
            maternityVM.coreDataManager.assignPersonalBG(personalBG: personalBg)
            
            for cell in cells{
                if cell.id == BloodView.id{
                    let bloodType = bloodView.aboMenu.selectedOption
                    
                    let igm = bloodView2.igmCheckYES.getBooleanValue()
                    let igg = bloodView2.iggCheckYES.getBooleanValue()
                    let hiv = bloodView2.hivCheckYES.getBooleanValue()
                    let urea = bloodView.ureiaMenu.selectedValue
                    let ht = bloodView.htMenu.selectedValue
                    let leucocitos = Int(bloodView.leucocitosMenu.selectedValue)
                    let plaquetas = Int(bloodView.plaquetasMenu.selectedValue)
                    let gliecmia = Int(bloodView.glicemiaMenu.selectedValue)
                    let vdrl = bloodView2.vdrlMenu.selectedOption
                    
                    
                    let blood = BloodExamModel(consultNumber: self.consultID!, bloodType: BloodType(rawValue: bloodType) ?? BloodType.ANegative, toxoplasmosis: .init(igm: igm, igg: igg), hiv: hiv, vdrl: vdrl , urea: .init(mg: urea, dL: Float(urea)), creatine: 0, ht: Float(ht), hb: 10, whiteCells: leucocitos , platelets: plaquetas , glucose: gliecmia )
                    
                    self.consult?.bloodExams = blood
                    break
                }
            }
            
            for cell in cells{
                if cell.id == UltrasoundView.id{
                    //Add new Ultrassound
                    
                    let date = ultrasoundView.dataMenu.date
                    let gestacionalAge = ultrasoundView.igMenu.getPickerValue()
                    let peso = Float(ultrasoundView.pesoMenu.getPickerValue())
                    let placenta = ultrasoundView.placentaMenu.selectedOption
                    let fetalPosition = ultrasoundView.apresentacaoFetalMenu.selectedOption
                    let ila = ultrasoundView.ilaMenu.selectedValue
                    
                    
                    let ultrassound = UltrasoundExam(date: date, consultNumber: self.consultID!, ig: IdadeGestacional(semanas: 0, dias: 0), ILA: ila, gestacionalAge: gestacionalAge, weight: peso , placenta: Placenta(rawValue: placenta) ?? .anterior, fetalPosition: FetalPosition(rawValue: fetalPosition) ?? .pelvica)
                    
                    self.consult?.ultraSoundExams = ultrassound
                    break
                }
            }
            
            
            
            for cell in cells{
                
                if cell.id == TetanicView.id{
                    //Add vaccine
                    let antitetanic = tetanicView.yesCheckYES.checked
                    let influenza = h1N1View.h1N1YesCheckYES.checked
                    let hepatite = hepatitisBView.hepatitisBYesCheckYES.checked
                    
                    // FIX ME : Ajustar as doses das vacinas na view que nÃo existem
                    let vaccine = Vaccines(hepatiteB: [DoseVaccines(date: Date(), isVaccined: antitetanic, numberOfDose: 1)], influenza: DoseVaccines(date: Date(), isVaccined: influenza, numberOfDose: 1), antitetanic: [DoseVaccines(date: Date(), isVaccined: hepatite, numberOfDose: 1)])
                    //Adicionar as vacinas antitetanicas e hepatite
                    self.maternityVM.coreDataManager.addVaccineInfluenza(dose: vaccine.influenza)
                    self.maternityVM.coreDataManager.addVaccineHepatite(dose: vaccine.hepatiteB.first ?? DoseVaccines(date: Date(), isVaccined: hepatite, numberOfDose: 0))
                    self.maternityVM.coreDataManager.addVaccineAntitetanic(dose: vaccine.antitetanic.first ?? DoseVaccines(date: Date(), isVaccined: antitetanic, numberOfDose: 0))
                    break
                }
                
            }
            
            //Save the current consult
            if let addConsult = self.consult{
                
                maternityVM.createNewConsult(consult: addConsult)
                
            }
            
            //IF it is not the first appointment
        }else{
            
            for cell in cells{
                if cell.id == BloodView.id{
                    
                    //Add bloodExam
                    // FIX ME : Arrumar os dropDowns do exame de sangue pois não esta retornando valor
                    let bloodType = bloodView.aboMenu.selectedOption
                    
                    let igm = bloodView2.igmCheckYES.getBooleanValue()
                    let igg = bloodView2.iggCheckYES.getBooleanValue()
                    let hiv = bloodView2.hivCheckYES.getBooleanValue()
                    let urea = bloodView.ureiaMenu.selectedValue
                    let ht = bloodView.htMenu.selectedValue
                    let leucocitos = Int(bloodView.leucocitosMenu.selectedValue)
                    let plaquetas = Int(bloodView.plaquetasMenu.selectedValue)
                    let gliecmia = Int(bloodView.glicemiaMenu.selectedValue)
                    let vdrl = bloodView2.vdrlMenu.selectedOption
                    
                    
                    let blood = BloodExamModel(consultNumber: self.consultID!, bloodType: BloodType(rawValue: bloodType) ?? BloodType.ANegative, toxoplasmosis: .init(igm: igm, igg: igg), hiv: hiv, vdrl: vdrl, urea: .init(mg: urea, dL: Float(urea)), creatine: 0, ht: Float(ht), hb: 10, whiteCells: leucocitos , platelets: plaquetas , glucose: gliecmia )
                    
                    self.consult?.bloodExams = blood
                    break
                }
            }
            
            for cell in cells{
                if cell.id == UltrasoundView.id{
                    
                    //Add new Ultrassound
                    // FIX ME : Mudar o date para do tipo date e nao string
                    let date = ultrasoundView.dataMenu.date
                    let gestacionalAge = ultrasoundView.igMenu.getPickerValue()
                    let peso = Float(ultrasoundView.pesoMenu.getPickerValue())
                    let placenta = ultrasoundView.placentaMenu.selectedOption
                    let fetalPosition = ultrasoundView.apresentacaoFetalMenu.selectedOption
                    let ila = ultrasoundView.ilaMenu.selectedValue
                    
                    
                    let ultrassound = UltrasoundExam(date: date, consultNumber: self.consultID!, ig: IdadeGestacional(semanas: 0, dias: 0), ILA: ila, gestacionalAge: gestacionalAge, weight: peso , placenta: Placenta(rawValue: placenta) ?? .anterior, fetalPosition: FetalPosition(rawValue: fetalPosition) ?? .pelvica)
                    
                    self.consult?.ultraSoundExams = ultrassound
                    break
                }
            }
            
            
            
            for cell in cells{
                if cell.id == TetanicView.id{
                    //Add vaccine
                    let antitetanic = tetanicView.yesCheckYES.checked
                    let influenza = h1N1View.h1N1YesCheckYES.checked
                    let hepatite = hepatitisBView.hepatitisBYesCheckYES.checked
                    
                    // FIX ME : Ajustar as doses das vacinas na view que nÃo existem
                    let vaccine = Vaccines(hepatiteB: [DoseVaccines(date: Date(), isVaccined: antitetanic, numberOfDose: 1)], influenza: DoseVaccines(date: Date(), isVaccined: influenza, numberOfDose: 1), antitetanic: [DoseVaccines(date: Date(), isVaccined: hepatite, numberOfDose: 1)])
                    //Adicionar as vacinas antitetanicas e hepatite
                    self.maternityVM.coreDataManager.addVaccineInfluenza(dose: vaccine.influenza)
                    self.maternityVM.coreDataManager.addVaccineHepatite(dose: vaccine.hepatiteB.first ?? DoseVaccines(date: Date(), isVaccined: hepatite, numberOfDose: 0))
                    self.maternityVM.coreDataManager.addVaccineAntitetanic(dose: vaccine.antitetanic.first ?? DoseVaccines(date: Date(), isVaccined: antitetanic, numberOfDose: 0))
                    
                    break
                }
            }
            
            //Saving the current consult
            if let addConsult = self.consult{
                maternityVM.createNewConsult(consult: addConsult)
            }
            
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
