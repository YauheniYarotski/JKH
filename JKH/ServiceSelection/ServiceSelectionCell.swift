//
//  ServiceSelectionCell.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/18/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import UIKit

class ServiceSelectionCell: UICollectionViewCell {
  
  let titleLabel = UILabel()
  let imageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(titleLabel)
    contentView.addSubview(imageView)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
    
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 0
    titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
//    titleLabel
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -18).isActive = true
    imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32).isActive = true
    imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22).isActive = true
    imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22).isActive = true
    imageView.contentMode = .scaleAspectFit
//    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    
    contentView.layer.shadowColor = UIColor.black.cgColor
    contentView.layer.shadowOffset = CGSize(width: 1, height: 2)
    contentView.layer.shadowOpacity = 0.2
    contentView.layer.shadowRadius = 4
    contentView.layer.cornerRadius = 4
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}


extension UICollectionViewCell {
  static var generatedReuseIdentifier: String {
    return String(describing: self)
  }
}
