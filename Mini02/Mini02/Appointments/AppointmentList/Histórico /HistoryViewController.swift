import UIKit


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
    private lazy var textView = NotasView()
    
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
        
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        familyAntecedentView.sections[AppointmentsKeys.hipertensao.rawValue]?.checked = true
        configureView()
    }
    
    override func viewDidLoad() {
        
        setupCollectionView()
        
        collectionView.isEditing = true
        
        collectionView.backgroundColor = UIColor(red: 1.00, green: 0.96, blue: 0.96, alpha: 1.00)
        
        self.hidesBottomBarWhenPushed = true
        // Create a custom UIButton
        let customButton = UIButton(type: .custom)

        // Set the image for the button
        let image = UIImage(named: "ChevronBackButton")
  
        customButton.setImage(image, for: .normal)
        

        // Set the title for the button
        customButton.setTitle("  Consultas", for: .normal)
        customButton.setTitleColor(UIColor.darkPink(), for: .normal) // Adjust text color as needed
        // Get the preferred body font
        let bodyFont = UIFont.preferredFont(forTextStyle: .body)

        // Calculate the scaled font size
        let scaledFontSize = bodyFont.pointSize * 0.9

        let signikaBoldFont = UIFont(name: "Signika-Bold", size: scaledFontSize)

        // Set the scaled font for the title
        customButton.titleLabel?.font = signikaBoldFont
        
        // Set the action for the button
        customButton.addTarget(self, action: #selector(backToView), for: .touchUpInside)

        // Adjust the size of the button to fit its content
        customButton.sizeToFit()

        // Create a UIBarButtonItem with the custom UIButton as the custom view
        let customBarButtonItem = UIBarButtonItem(customView: customButton)

        // Set the custom UIBarButtonItem as the back button for the navigation item
        navigationItem.leftBarButtonItem = customBarButtonItem
        
        let bgImage = UIImage(named: "backGroundRecurrentData")
        if let image = bgImage{
            self.view.backgroundColor = UIColor(patternImage: image)
            self.collectionView.backgroundColor = UIColor(patternImage: image)
        }
        
        self.hidesBottomBarWhenPushed = true
        
    }
    
    //Function of backButton
    @objc func backToView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //register the cell to the indentifiers
    func setupCollectionView(){
        
        HeaderForHistory.currentConsult = appointmentsInfo.consultId
        HeaderForHistory.currentDate = appointmentsInfo.date
        
        cells.forEach { collectionView.register(MaternityCardCell.self, forCellWithReuseIdentifier: $0.id) }
        collectionView.register(HeaderForHistory.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderForHistory.id)
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
        cell.isUserInteractionEnabled = false
        cell.isEditModeActive = isEditModeActive
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cells[indexPath.row].size
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.id, for: indexPath) as! HeaderForHistory
            
            HeaderForHistory.currentConsult = appointmentsInfo.consultId
            
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Return the desired size for the header
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    
    var isEditModeActive = false
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        isEditModeActive.toggle()
        collectionView.reloadData() // Reload the collection view to reflect the changes.
    }
    
    func configureView(){
        let pacient = historyVm.getPatient()
        
        // IG, Uterine, Weight
        
        routineData.igMenu.selectedValue = Int(appointmentsInfo.routineData?.ig ?? 0)
        routineData.igMenu.setPickerValue(to: Int(appointmentsInfo.routineData?.ig ?? 0))
        
        routineData.edemaMenu.selectedOption = appointmentsInfo.routineData?.edema ?? ""
        routineData.bcfMenu.selectedOption = appointmentsInfo.routineData?.bcf ?? ""
        
        routineData.uterineHeightMenu.selectedValue = Int(appointmentsInfo.routineData?.uterineHeightInCentimeters ?? 0)
        routineData.uterineHeightMenu.setPickerValue(to: Int(appointmentsInfo.routineData?.uterineHeightInCentimeters ?? 0))
        
        routineData.wheightMenu.selectedValue = appointmentsInfo.routineData?.weightAndBodyMassIndex ?? 0.0
        routineData.wheightMenu.setPickerValue(to: appointmentsInfo.routineData?.weightAndBodyMassIndex ?? 0)
        
        routineData.arterialPressureMenu.text = appointmentsInfo.routineData?.bloodPressureInmmHG ?? ""
        
        let views: [CellInfo] = [
            CellInfo(view: routineData, size: routineData.routineDataViewSize, id: RoutineDataView.id, query: routineData.query)
        ]
        
        addNewView(views: views)
        
        
        if appointmentsInfo.tremesteer == 1 && appointmentsInfo.consultId == 1{
            //Set the data of familyAntecedents
            familyAntecedentView.sections[AppointmentsKeys.hipertensao.rawValue]?.checked = pacient?.familyBG?.hypertension ?? false
            familyAntecedentView.sections[AppointmentsKeys.diabetes.rawValue]?.checked = pacient?.familyBG?.diabetes ?? false
            familyAntecedentView.sections[AppointmentsKeys.cardiopatia.rawValue]?.checked = pacient?.familyBG?.heartCondition ?? false
            familyAntecedentView.sections[AppointmentsKeys.outro.rawValue]?.checked = pacient?.familyBG?.urinaryInfection ?? false
            
            
            //Assign the values of preganancyType
            pregnancyTypeView.section[AppointmentsKeys.gemelar.rawValue]?.checked = appointmentsInfo.pregnancyClassification?.twinPregnancy ?? false
            pregnancyTypeView.section[AppointmentsKeys.triplaOuMais.rawValue]?.checked = appointmentsInfo.pregnancyClassification?.tripletsOrMorePregnancy ?? false
            pregnancyTypeView.section[AppointmentsKeys.unica.rawValue]?.checked = appointmentsInfo.pregnancyClassification?.singlePregnancy ?? false
            
            
            //Assign values of pregnancyRisk
            pregnancyRiskView.section[AppointmentsKeys.riscoHabitual.rawValue]?.checked = appointmentsInfo.pregnancyRisk?.lowRiskPregnancy ?? false
            pregnancyRiskView.section[AppointmentsKeys.altoRisco.rawValue]?.checked = appointmentsInfo.pregnancyRisk?.highRiskPregnancy ?? false
            
            
            //Assign the values of plannedView
            if let planned = appointmentsInfo.pregnancyPlanning?.plannedPregnancy{
                if planned{
                    plannedView.plannedCheckYES.checked = true
                    plannedView.plannedCheckNO.checked = false
                }else{
                    plannedView.plannedCheckNO.checked = true
                    plannedView.plannedCheckYES.checked = false
                }
            }
           
            
            
            
            //Assign values of clinicalAntecedents
            clinicAntecedentsView.sections[AppointmentsKeys.urinary.rawValue]?.checked = pacient?.personalBG?.urinaryInfection ?? false
            clinicAntecedentsView.sections[AppointmentsKeys.hipertensao.rawValue]?.checked  = pacient?.personalBG?.hypertension ?? false
            clinicAntecedentsView.sections[AppointmentsKeys.fuma.rawValue]?.checked = pacient?.personalBG?.tabagism ?? false
            clinicAntecedentsView.sections[AppointmentsKeys.cardiopatia.rawValue]?.checked = pacient?.personalBG?.heartCondition ?? false
            clinicAntecedentsView.sections[AppointmentsKeys.diabetes.rawValue]?.checked = pacient?.personalBG?.diabetes ?? false
            
            //Assigng clinical antecendentsView
            
            
            let views: [CellInfo] = [
                CellInfo(view: familyAntecedentView, size: familyAntecedentView.familyAntecedentViewSize, id: FamilyAntecedentView.id, query: familyAntecedentView.query),
                CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id, query: plannedView.query),
                CellInfo(view: clinicAntecedentsView, size: clinicAntecedentsView.clinicAntecedentsViewSize, id: ClinicAntecedentsView.id, query: clinicAntecedentsView.query),
                CellInfo(view: pregnancyRiskView, size: pregnancyRiskView.pregnancyRiskViewSize, id: PregnancyRiskView.id, query: pregnancyRiskView.query),
                CellInfo(view: pregnancyTypeView, size: pregnancyTypeView.pregnancyTypeViewSize, id: PregnancyTypeView.id, query: pregnancyTypeView.query)
            ]
            
            addNewView(views: views)
            
            
            //Add vaccines view
            if pacient!.vaccines != nil{
                
                //Assign data antitetanic
                let antitetanic = historyVm.coreDataMaanger.getAntitetanic()
                let antitetanicIsVaccined = antitetanic.isEmpty
                
                if !antitetanicIsVaccined{
                    
                    tetanicView.yesCheckYES.checked = true
                    tetanicView.noCheckNO.checked = false
                    let antitetanicFirstDate = antitetanic[0].vaccineDate
                    let antitetanicSecondDate = antitetanic[1].vaccineDate
                    let antitetanicThirdDate = antitetanic[2].vaccineDate
                    
                    
                    tetanicView.firstDoseDate.date = antitetanicFirstDate ?? Date()
                    tetanicView.secondDoseDate.date = antitetanicSecondDate ?? Date()
                    tetanicView.thirdDoseDate.date = antitetanicThirdDate ?? Date()
                }else{
                    tetanicView.yesCheckYES.checked = false
                    tetanicView.noCheckNO.checked = true
                }
                
                
                //Assign hepatite data
                let hepatite = historyVm.coreDataMaanger.getHepatite()
                let hepatiteIsVaccined = hepatite.isEmpty
                
                if !hepatiteIsVaccined{
                    hepatitisBView.hepatitisBYesCheckYES.checked = true
                    hepatitisBView.hepatitisBNoCheckNO.checked = false
                    
                    let hepatiteFirstDate = hepatite[0].vaccineDate
                    let hepatiteSecondDate = hepatite[1].vaccineDate
                    let hepatiteThirdDate = hepatite[2].vaccineDate
                    
                    
                    hepatitisBView.firstDoseDate.date = hepatiteFirstDate ?? Date()
                    hepatitisBView.secondDoseDate.date = hepatiteSecondDate ?? Date()
                    hepatitisBView.thirdDoseDate.date = hepatiteThirdDate ?? Date()
                }else{
                    hepatitisBView.hepatitisBYesCheckYES.checked = false
                    hepatitisBView.hepatitisBNoCheckNO.checked = true
                }
                       
                
                //Assign influenza data
                let influenza = historyVm.coreDataMaanger.getInfluenza()
                guard let influenzaVaccine = influenza else {return}
                
                if influenzaVaccine.isVaccined{
                    h1N1View.h1N1YesCheckYES.checked = true
                }else{
                    h1N1View.h1N1YesCheckYES.checked = false
                }
                
                
                
                //Assign all views to the array of views
                let views: [CellInfo] = [
                    CellInfo(view: tetanicView, size: tetanicView.tetanicViewSize, id: TetanicView.id, query: tetanicView.query),
                    CellInfo(view: hepatitisBView, size: hepatitisBView.hepatitisBViewSize, id: HepatitisBView.id, query: hepatitisBView.query),
                    CellInfo(view: h1N1View, size: h1N1View.h1N1ViewSize, id: H1N1View.id, query: h1N1View.query)
                ]
                
                addNewView(views: views)
            }
            
            
            // FIX ME : Adicionar o exame de sangue e ultrason na tela
            if let _ = appointmentsInfo.bloodExam{
                
                bloodView.aboMenu.selectedOption = (appointmentsInfo.bloodExam?.bloodType)!
                bloodView2.igmCheckYES.checked = appointmentsInfo.bloodExam?.toxoplasmosis?.igm ?? false
                bloodView2.iggCheckYES.checked = appointmentsInfo.bloodExam?.toxoplasmosis?.igg ?? false
                bloodView2.hivCheckYES.checked = appointmentsInfo.bloodExam?.hiv ?? false
                
                bloodView.ureiaMenu.selectedValue = Int(appointmentsInfo.bloodExam?.urea?.mg ?? 0)
                bloodView.ureiaMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.urea?.mg ?? 0))
                
                bloodView.htMenu.selectedValue = Int(appointmentsInfo.bloodExam?.ht ?? 0)
                bloodView.htMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.ht ?? 0))
                
                bloodView.leucocitosMenu.selectedValue = Int(appointmentsInfo.bloodExam?.whiteCells ?? 0)
                bloodView.leucocitosMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.whiteCells ?? 0))
                
                bloodView.plaquetasMenu.selectedValue = Int(appointmentsInfo.bloodExam?.platelets ?? 0)
                bloodView.plaquetasMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.platelets ?? 0))
                
                bloodView.glicemiaMenu.selectedValue = Int(appointmentsInfo.bloodExam?.glucose ?? 0)
                bloodView.glicemiaMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.glucose ?? 0))
                
                bloodView2.vdrlMenu.selectedOption = appointmentsInfo.bloodExam?.vdrlExam ?? ""
                
                bloodView.hbMenu.selectedValue = appointmentsInfo.bloodExam?.hb ?? 0
                bloodView.hbMenu.setPickerValue(to: appointmentsInfo.bloodExam?.hb ?? 0)
                
                bloodView.creatineMenu.selectedValue = appointmentsInfo.bloodExam?.creatine ?? 0
                bloodView.creatineMenu.setPickerValue(to: appointmentsInfo.bloodExam?.creatine ?? 0)
                
                let views: [CellInfo] = [
                    CellInfo(view: bloodView, size: bloodView.bloodViewViewSize, id: BloodView.id, query: bloodView.query),
                    CellInfo(view: bloodView2, size: bloodView2.bloodView2size, id: BloodView2.id, query: bloodView2.query)
                ]
                
                addNewView(views: views)
                
            }
            
            if let _ = appointmentsInfo.ultraSound{
                
                ultrasoundView.dataMenu.date = appointmentsInfo.ultraSound?.date ?? Date()
                
                ultrasoundView.igMenu.selectedValue = Int(appointmentsInfo.ultraSound?.gestacionalAge ?? 0)
                ultrasoundView.igMenu.setPickerValue(to: Int(appointmentsInfo.ultraSound?.gestacionalAge ?? 0))
                
                ultrasoundView.pesoMenu.selectedValue = Int(appointmentsInfo.ultraSound?.weight ?? 0)
                ultrasoundView.pesoMenu.setPickerValue(to: Int(appointmentsInfo.ultraSound?.weight ?? 0))
                
                ultrasoundView.placentaMenu.selectedOption = appointmentsInfo.ultraSound?.placenta ?? ""
                ultrasoundView.apresentacaoFetalMenu.selectedOption = appointmentsInfo.ultraSound?.fetalPosition ?? ""
                
                
                ultrasoundView.ilaMenu.selectedValue = Int(appointmentsInfo.ultraSound?.ila ?? 0)
                ultrasoundView.ilaMenu.setPickerValue(to: Int(appointmentsInfo.ultraSound?.ila ?? 0))
                
                let views: [CellInfo] = [
                    CellInfo(view: ultrasoundView, size: ultrasoundView.ultrasoundSize, id: UltrasoundView.id, query: ultrasoundView.query),
                ]
                
                addNewView(views: views)
            }
            
        }else{
            
            if let _ = appointmentsInfo.bloodExam{
                
                bloodView.aboMenu.selectedOption = (appointmentsInfo.bloodExam?.bloodType)!
                bloodView2.igmCheckYES.checked = appointmentsInfo.bloodExam?.toxoplasmosis?.igm ?? false
                bloodView2.iggCheckYES.checked = appointmentsInfo.bloodExam?.toxoplasmosis?.igg ?? false
                bloodView2.hivCheckYES.checked = appointmentsInfo.bloodExam?.hiv ?? false
                
                bloodView.ureiaMenu.selectedValue = Int(appointmentsInfo.bloodExam?.urea?.mg ?? 0)
                bloodView.ureiaMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.urea?.mg ?? 0))
                
                bloodView.htMenu.selectedValue = Int(appointmentsInfo.bloodExam?.ht ?? 0)
                bloodView.htMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.ht ?? 0))
                
                bloodView.leucocitosMenu.selectedValue = Int(appointmentsInfo.bloodExam?.whiteCells ?? 0)
                bloodView.leucocitosMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.whiteCells ?? 0))
                
                bloodView.plaquetasMenu.selectedValue = Int(appointmentsInfo.bloodExam?.platelets ?? 0)
                bloodView.plaquetasMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.platelets ?? 0))
                
                bloodView.glicemiaMenu.selectedValue = Int(appointmentsInfo.bloodExam?.glucose ?? 0)
                bloodView.glicemiaMenu.setPickerValue(to: Int(appointmentsInfo.bloodExam?.glucose ?? 0))
                
                bloodView2.vdrlMenu.selectedOption = appointmentsInfo.bloodExam?.vdrlExam ?? ""
                
                bloodView.hbMenu.selectedValue = appointmentsInfo.bloodExam?.hb ?? 0
                bloodView.hbMenu.setPickerValue(to: appointmentsInfo.bloodExam?.hb ?? 0)
                
                bloodView.creatineMenu.selectedValue = appointmentsInfo.bloodExam?.creatine ?? 0
                bloodView.creatineMenu.setPickerValue(to: appointmentsInfo.bloodExam?.creatine ?? 0)
                
                let views: [CellInfo] = [
                    CellInfo(view: bloodView, size: bloodView.bloodViewViewSize, id: BloodView.id, query: bloodView.query),
                    CellInfo(view: bloodView2, size: bloodView2.bloodView2size, id: BloodView2.id, query: bloodView2.query)
                ]
                
                addNewView(views: views)
            }
            
            if let _ = appointmentsInfo.ultraSound{
                
                ultrasoundView.dataMenu.date = appointmentsInfo.ultraSound?.date ?? Date()
                
                ultrasoundView.igMenu.selectedValue = Int(appointmentsInfo.ultraSound?.gestacionalAge ?? 0)
                ultrasoundView.igMenu.setPickerValue(to: Int(appointmentsInfo.ultraSound?.gestacionalAge ?? 0))
                
                ultrasoundView.pesoMenu.selectedValue = Int(appointmentsInfo.ultraSound?.weight ?? 0)
                ultrasoundView.pesoMenu.setPickerValue(to: Int(appointmentsInfo.ultraSound?.weight ?? 0))
                
                ultrasoundView.placentaMenu.selectedOption = appointmentsInfo.ultraSound?.placenta ?? ""
                ultrasoundView.apresentacaoFetalMenu.selectedOption = appointmentsInfo.ultraSound?.fetalPosition ?? ""
                
                ultrasoundView.ilaMenu.selectedValue = Int(appointmentsInfo.ultraSound?.ila ?? 0)
                ultrasoundView.ilaMenu.setPickerValue(to: Int(appointmentsInfo.ultraSound?.ila ?? 0))
                
                let views: [CellInfo] = [
                    CellInfo(view: ultrasoundView, size: ultrasoundView.ultrasoundSize, id: UltrasoundView.id, query: ultrasoundView.query),
                ]
                
                addNewView(views: views)
                
            }
            
        }
        
        if let notes = appointmentsInfo.notes {
            textView.setText(notes)
            textView.textViewComponent.textColor = UIColor.darkPink()
            let views = [
                CellInfo(view: textView, size: textView.viewSize, id: NotasView.id, query: textView.query)
            ]
            addNewView(views: views)
        }
    }
    
    func addNewView(views: [CellInfo]){
        for view in views {
            cells.append(view)
            setupCollectionView()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
