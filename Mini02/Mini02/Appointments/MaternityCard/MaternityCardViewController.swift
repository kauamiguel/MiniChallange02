//
//  AntenatalViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class MaternityCardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    private lazy var views: [UIView] = [ProfileView()]
    
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(MaternityCardView.self, forCellWithReuseIdentifier: MaternityCardView.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
            
        
        view.backgroundColor = .white
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setUpUI(){
        
        self.view.addSubview(collectionView)
        
        collectionView.anchorWithContantValues(top: self.view.topAnchor, left: self.view.leadingAnchor, right: self.view.trailingAnchor, bottom: self.view.bottomAnchor)
        
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
        //        views.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MaternityCardView.identifier, for: indexPath) as? MaternityCardView else {
            fatalError("dequee maternityCard")
        }
        let view = self.views[indexPath.row]
        cell.configure(with: view)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500, height: 500)
    }
}

