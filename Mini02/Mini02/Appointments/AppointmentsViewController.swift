//
//  HomeViewController.swift
//  Mini02
//
//  Created by Gabriel Eirado on 14/09/23.
//

import UIKit

class AppointmentsViewController: UIViewController {

    var appointmentViewModelManager: AppointmentsVM?
    var appointmentViewManager: AppointmentsView?
    
    let titles = ["1° Trimestre", "2° Trimestre", "3° Trimestre"]
    var currentPage = 0
    let pageControl = UIPageControl()
    
    lazy var collection = UICollectionView(frame: .zero, collectionViewLayout: AppointmentsView.layout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appointmentViewManager?.titles = titles
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
        appointmentViewManager?.pageControl = pageControl
        appointmentViewManager?.currentPage = currentPage
        appointmentViewManager?.collection = collection
        appointmentViewManager?.collection?.dataSource = self
        appointmentViewManager?.collection?.delegate = self
        appointmentViewManager?.setupView(vc: self)
    }
    
    @objc func pageControlValueChanged(sender: UIPageControl) {
        appointmentViewModelManager?.didTapPageControl(sender, collection: collection)
    }
    
    //Functions to communicate with list view to know wich semester are
    @objc func firstTreemesterAction(){
      appointmentViewModelManager?.buttonFuncionality(treemesterNumber: 1)
    }
    
    @objc func secondTreemesterAction(){
      appointmentViewModelManager?.buttonFuncionality(treemesterNumber: 2)
    }
    
    @objc func thirdTreemesterAction(){
      appointmentViewModelManager?.buttonFuncionality(treemesterNumber: 3)
    }
}

extension AppointmentsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppointmentCell.identifier, for: indexPath) as! AppointmentCell
        cell.titleLabel.setupLabel(labelText: titles[indexPath.item].localized(), labelType: .titleRegular, labelColor: .primaryText)
        let images = [UIImage(resource: .consultas1Trimestre), UIImage(resource: .consultas2Trimestre), UIImage(resource: .consultas3Trimestre)]
        cell.buttonImage.setBackgroundImage(images[indexPath.item], for: .normal)
        let selectors = [ #selector(firstTreemesterAction), #selector(secondTreemesterAction), #selector(thirdTreemesterAction) ]
        cell.buttonImage.addTarget(self, action: selectors[indexPath.item], for: .touchUpInside)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set size for each item
        return collectionView.frame.size
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        currentPage = Int(scrollView.contentOffset.x / pageWidth)
        pageControl.currentPage = currentPage
    }
}

