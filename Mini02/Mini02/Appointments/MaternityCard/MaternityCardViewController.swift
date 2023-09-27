//
//  AntenatalViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    private lazy var defaultView = DefaultView()
    private lazy var bloodView = BloodView()
    private lazy var ultrasoundView = UltrasoundView()
    
    
    private var cells: [CellInfo] = []
    
    
    
    private var vm = MaternityCardViewModel()
    
    init(){
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
        
        cells = [
            CellInfo(view: defaultView, size: defaultView.defaultViewSize, id: DefaultView.id),
            CellInfo(view: bloodView, size: bloodView.bloodViewViewSize, id: BloodView.id),
            CellInfo(view: ultrasoundView, size: ultrasoundView.ultrasoundViewSize, id: UltrasoundView.id)
        ]
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    override func viewDidLoad() {
        
        setupCollectionView()
        
        collectionView.backgroundColor = .white
        
        self.hidesBottomBarWhenPushed = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(addNewItem))
        
    }
    
    //Adicionar dados dinamicamente na celula
    @objc func addNewItem(){
        addNewDefaultViewCell(defaultView: DefaultView())
        collectionView.reloadData()
    }
    
    private func addNewDefaultViewCell(defaultView : DefaultView? = nil) {
        var hasView = false
        
        for object in cells{
            if type(of: object.view) == DefaultView.self{
                hasView = true
                print("Ja existe esse elemento")
                break
            }
        }
        
        if let _ = defaultView, hasView == false{
            //            cells.append((view: defaultView!, id: DefaultView.id))
            setupCollectionView()
        }
        
    }
    
    private func addNewBloodViewCell(bloodView : BloodView? = nil) {
        var hasView = false
        
        for object in cells{
            if type(of: object.view) == BloodView.self{
                hasView = true
                print("Ja existe esse elemento")
                break
            }
        }
        
        if let _ = bloodView, hasView == false{
            //            cells.append((view: bloodView!, id: BloodView.id))
            setupCollectionView()
        }
        
    }
    
    private func addNewUltrassonViewCell(ultrassonView : UltrasoundView? = nil) {
        var hasView = false
        
        for object in cells{
            if type(of: object.view) == UltrasoundView.self{
                hasView = true
                print("Ja existe esse elemento")
                break
            }
        }
        
        if let _ = ultrassonView, hasView == false{
            //            cells.append((view: ultrassonView!, id: UltrasoundView.id))
            setupCollectionView()
        }
        
    }
    
    
    //register the cell to the indentifiers
    private func setupCollectionView(){
        cells.forEach { collectionView.register(MaternityCardCell.self, forCellWithReuseIdentifier: $0.id) }
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
    
    
    func collectionView(_ collectionView: UICollectionView, contextMenuInteraction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        animator?.addAnimations { [weak self] in
            self?.collectionView.updateInteractiveMovementTargetPosition(contextMenuInteraction.location(in: MaternityCardCell()))
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuInteraction: UIContextMenuInteraction, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
        animator.addCompletion { [weak self] in
            self?.collectionView.endInteractiveMovement()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
