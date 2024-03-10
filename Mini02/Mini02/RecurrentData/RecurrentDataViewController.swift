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
    private var searchTimer: Timer?
    private var pacient: Pacient?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = 30
        super.init(collectionViewLayout: layout)
        
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
        
        //Assign the last Consult each time the view lods
        self.lastConsult = recurrentDataVM.getLastConsult()
        
        //Populate the cells based on the last exam info and the static information
        populateCells()
        
        self.filteredCell = cells
        recurrentView.setupView(vc: self, collection: self.collectionView)
        setupCollectionView()
        
        //Gesture to dismiss the keyboard when click on any view in the screen
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    func populateCells(){
        self.pacient = recurrentDataVM.getPatient()
        
        //Verify wheter is in the first consult
        if !ApplicationSettings.shouldEnterFirstAppointment(){
            // Family Background
            if let bg = self.pacient?.familyBG {
                familyAntecedentView.sections[AppointmentsKeys.hipertensao.rawValue]?.checked = bg.hypertension
                familyAntecedentView.sections[AppointmentsKeys.diabetes.rawValue]?.checked = bg.diabetes
                familyAntecedentView.sections[AppointmentsKeys.cardiopatia.rawValue]?.checked = bg.heartCondition
                familyAntecedentView.sections[AppointmentsKeys.outro.rawValue]?.checked = bg.urinaryInfection
                cells.append(CellInfo(view: familyAntecedentView, size: familyAntecedentView.familyAntecedentViewSize, id: FamilyAntecedentView.id, query: familyAntecedentView.query))
                
                clinicAntecedentsView.sections[AppointmentsKeys.urinary.rawValue]?.checked = bg.urinaryInfection
                clinicAntecedentsView.sections[AppointmentsKeys.hipertensao.rawValue]?.checked  = bg.hypertension
                clinicAntecedentsView.sections[AppointmentsKeys.fuma.rawValue]?.checked = bg.tabagism
                clinicAntecedentsView.sections[AppointmentsKeys.cardiopatia.rawValue]?.checked = bg.heartCondition
                clinicAntecedentsView.sections[AppointmentsKeys.diabetes.rawValue]?.checked = bg.diabetes
                cells.append(CellInfo(view: clinicAntecedentsView, size: clinicAntecedentsView.clinicAntecedentsViewSize, id: ClinicAntecedentsView.id, query: clinicAntecedentsView.query))
            }
            
            // PregnancyType
            if let pregnancyType = self.lastConsult?.pregnancyClassification {
                pregnancyTypeView.section[AppointmentsKeys.gemelar.rawValue]?.checked = pregnancyType.twinPregnancy
                pregnancyTypeView.section[AppointmentsKeys.triplaOuMais.rawValue]?.checked = pregnancyType.tripletsOrMorePregnancy
                pregnancyTypeView.section[AppointmentsKeys.unica.rawValue]?.checked = pregnancyType.singlePregnancy
                cells.append(CellInfo(view: pregnancyTypeView, size: pregnancyTypeView.pregnancyTypeViewSize, id: PregnancyTypeView.id, query: pregnancyTypeView.query))
            }
            if let planned = self.lastConsult?.pregnancyPlanning {
                plannedView.plannedCheckYES.checked = planned.plannedPregnancy
                plannedView.plannedCheckNO.checked = !planned.plannedPregnancy
                cells.append(CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id, query: plannedView.query))
            }
        }
        
        //Last Routine Data
        if let routine = self.lastConsult?.routineData {
            routineData.igMenu.selectedValue = Int(routine.ig)
            routineData.igMenu.setPickerValue(to: Int(routine.ig))
            
            routineData.edemaMenu.selectedOption = routine.edema ?? ""
            routineData.bcfMenu.selectedOption = routine.bcf ?? ""
            
            routineData.uterineHeightMenu.selectedValue = Int(routine.uterineHeightInCentimeters)
            routineData.uterineHeightMenu.setPickerValue(to: Int(routine.uterineHeightInCentimeters))
            
            routineData.wheightMenu.selectedValue = routine.weightAndBodyMassIndex
            routineData.wheightMenu.setPickerValue(to: routine.weightAndBodyMassIndex)
            
            routineData.arterialPressureMenu.text = routine.bloodPressureInmmHG ?? ""
            
            cells.append(CellInfo(view: routineData, size: routineData.routineDataViewSize, id: RoutineDataView.id, query: routineData.query))
        }
        
        //Verify if exist blood exam, and if has, add in the view the last exam information
        if let bloodExam = self.lastConsult?.bloodExam {
            bloodView.aboMenu.selectedOption = (bloodExam.bloodType)!
            
            bloodView.ureiaMenu.selectedValue = Int(bloodExam.urea?.mg ?? 0)
            bloodView.ureiaMenu.setPickerValue(to: Int(bloodExam.urea?.mg ?? 0))
            
            bloodView.htMenu.selectedValue = Int(bloodExam.ht)
            bloodView.htMenu.setPickerValue(to: Int(bloodExam.ht))
            
            bloodView.leucocitosMenu.selectedValue = Int(bloodExam.whiteCells)
            bloodView.leucocitosMenu.setPickerValue(to: Int(bloodExam.whiteCells))
            
            bloodView.plaquetasMenu.selectedValue = Int(bloodExam.platelets)
            bloodView.plaquetasMenu.setPickerValue(to: Int(bloodExam.platelets))
            
            bloodView.glicemiaMenu.selectedValue = Int(bloodExam.glucose)
            bloodView.glicemiaMenu.setPickerValue(to: Int(bloodExam.glucose))
            
            bloodView.hbMenu.selectedValue = bloodExam.hb
            bloodView.hbMenu.setPickerValue(to: bloodExam.hb)
            
            bloodView.creatineMenu.selectedValue = bloodExam.creatine
            bloodView.creatineMenu.setPickerValue(to: bloodExam.creatine)
            
            cells.append(CellInfo(view: bloodView, size: bloodView.bloodViewViewSize, id: BloodView.id, query: bloodView.query))
        }
        
        //Verify if exist ultrasound exam, and if has, add in the view the last exam information
        if let ultrasound = self.lastConsult?.ultraSound{
            ultrasoundView.dataMenu.date = ultrasound.date ?? Date()
            
            ultrasoundView.igMenu.selectedValue = Int(ultrasound.gestacionalAge)
            ultrasoundView.igMenu.setPickerValue(to: Int(ultrasound.gestacionalAge))
            
            ultrasoundView.pesoMenu.selectedValue = Int(ultrasound.weight)
            ultrasoundView.pesoMenu.setPickerValue(to: Int(ultrasound.weight))
            
            ultrasoundView.placentaMenu.selectedOption = ultrasound.placenta ?? ""
            ultrasoundView.apresentacaoFetalMenu.selectedOption = ultrasound.fetalPosition ?? ""
            
            
            ultrasoundView.ilaMenu.selectedValue = Int(ultrasound.ila)
            ultrasoundView.ilaMenu.setPickerValue(to: Int(ultrasound.ila))
            
            cells.append(CellInfo(view: ultrasoundView, size: ultrasoundView.ultrasoundSize, id: UltrasoundView.id, query: ultrasoundView.query))
        }
        
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
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cells[indexPath.row].size
    }
    
    
    
    
    //Create a search bar that filter the content of my cells
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { _ in
            self.performSearch(searchText)
        }
    }
    
    func performSearch(_ search: String) {
        
        let keywords: [String:CellInfo] = [
            "antecedentes familiares diabetes hipertensão cardiopatia": CellInfo(view: familyAntecedentView, size: familyAntecedentView.familyAntecedentViewSize, id: FamilyAntecedentView.id, query: familyAntecedentView.query),
            "antecedentes clínicos cardiopatia hipertensão infecção urinaria fuma diabetes": CellInfo(view: clinicAntecedentsView, size: clinicAntecedentsView.clinicAntecedentsViewSize, id: ClinicAntecedentsView.id, query: clinicAntecedentsView.query),
            "tipos de gravidez unica gemelar": CellInfo(view: pregnancyTypeView, size: pregnancyTypeView.pregnancyTypeViewSize, id: PregnancyTypeView.id, query: pregnancyTypeView.query),
            "gravidez planejada": CellInfo(view: plannedView, size: plannedView.pregnancyRiskViewSize, id: PlannedView.id, query: plannedView.query),
            "dados de rotina ig dum usg peso imc altura uterina pressão arterial bcf edema idade gestacional data última menstruação": CellInfo(view: routineData, size: routineData.routineDataViewSize, id: RoutineDataView.id, query: routineData.query),
            "exame sangue ureia leucócitos hta hb plaquetas creatina glicemia abo rh": CellInfo(view: bloodView, size: bloodView.bloodViewViewSize, id: BloodView.id, query: bloodView.query),
            "ultrasom ultrasonografia data idade gestacional peso placenta ila apresentação fetal exame recente": CellInfo(view: ultrasoundView, size: ultrasoundView.ultrasoundSize, id: UltrasoundView.id, query: ultrasoundView.query)
        ]
        if search.isEmpty {
            filteredCell = cells
        } else {
            var candidates = [CellInfo]()
            for (keywords, containingCell) in keywords {
                if keywords.lowercased().localizedCaseInsensitiveContains(search.lowercased()) {
                    candidates.append(containingCell)
                }
            }
            filteredCell = candidates.sorted(by: { $0.query < $1.query }) // This is a trick to fix the order so the layout doesnt break as much. I know its hacky af and should no be relied on. - Fabio
        }
        self.collectionView.reloadData()
    }
    
}
