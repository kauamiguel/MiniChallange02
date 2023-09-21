//
//  AntenatalViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    lazy var size = UIScreen.main.bounds.size
    private lazy var managerVM = MaternityCardViewModel()
    
    private lazy var defaultView = DefaultView()
    private lazy var bloodView = BloodView()
    private lazy var ultrasoundView = UltrasoundView()
    
    
    private lazy var cells: [(view: UIView, id: String)] = [(defaultView, DefaultView.id),
                                                            (bloodView, BloodView.id),
                                                            (ultrasoundView, UltrasoundView.id)]
    
    init(){
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
       
    }
    
    override func viewDidLoad() {
        
        setupCollectionView()
        
        collectionView.backgroundColor = .white
        
        self.hidesBottomBarWhenPushed = true
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
         
        let sizesForcells = [defaultView.defaultViewSize,
                             bloodView.bloodViewViewSize,
                             ultrasoundView.ultrasoundViewSize]
        
        return sizesForcells[indexPath.row]
    }
    
    // move items
   
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
   
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedItem = cells.remove(at: sourceIndexPath.row)
        
        cells.insert(movedItem, at: destinationIndexPath.row)
    }
    
//    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
//        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
//            return UIMenu(title: "", children: [
//                UIAction(title: "Move", image: UIImage(systemName: "arrow.right.circle.fill")) { [weak self] _ in
//                    self?.collectionView.beginInteractiveMovementForItem(at: indexPath)
//                }
//            ])
//        }
//        return configuration
//    }
    
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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

