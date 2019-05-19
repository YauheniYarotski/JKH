//
//  ServicesSelectionVC.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/18/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import UIKit

class ServiceSelectionVC: UIViewController {
  
  let interactor = ServiceSelectionInteractor()
  var collectionView: UICollectionView = {
    let lay = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: lay)
    return collectionView
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor.backgroundColor
      collectionView.backgroundColor = UIColor.backgroundColor
      view.addSubview(collectionView)
      
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
      
      collectionView.delegate = self
      collectionView.dataSource = self
      collectionView.register(ServiceSelectionCell.self, forCellWithReuseIdentifier: ServiceSelectionCell.generatedReuseIdentifier)
      collectionView.bounces = true
      collectionView.alwaysBounceVertical = true
      collectionView.clipsToBounds = false

    }
  
}


extension ServiceSelectionVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return interactor.amountOfServices
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceSelectionCell.generatedReuseIdentifier, for: indexPath) as! ServiceSelectionCell
    
    cell.contentView.backgroundColor = .white
    let row = (indexPath as NSIndexPath).row
    let service = interactor.service(for: row)
    cell.imageView.image = service.image
    cell.titleLabel.text = service.name
//    cell.activityIndicator.startAnimating()
//    cell.delegate = self
//    cell.tag = row
    cell.contentView.actionViewClosure = {
      let subVC = SubServiceSelectionVC()
      subVC.navigationItem.title = service.name
      subVC.interactor.selectedService = service
      self.navigationController?.pushViewController(subVC, animated: true)
    }
    
    return cell 
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let padding: CGFloat =  10
    let collectionViewSize = collectionView.frame.size.width - padding
    
    return CGSize(width: collectionViewSize/2, height: collectionViewSize/2 * 1.36)
  }
  
}
