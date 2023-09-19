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
  
        private lazy var cells: [(view: UIView, id: String)] = [(defaultView, DefaultView.id),
                                                                (bloodView, BloodView.id),
                                                                (ultrasoundView, UltrasoundView.id)]
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        setupCollectionView()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    private func setupCollectionView(){
       cells.forEach { collectionView.register(MaternityCardCell.self, forCellWithReuseIdentifier: $0.id) }
    }
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cells[indexPath.row].id, for: indexPath) as? MaternityCardCell else { return UICollectionViewCell() }
        cell.setUpcell(view: cells[indexPath.row].view)
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

