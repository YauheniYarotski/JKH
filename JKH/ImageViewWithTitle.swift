//
//  ImageViewWithTitle.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/19/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import UIKit

class ImageViewWithTitle: UIView {
  
  var imageView = UIImageView()
  var textLabel = UILabel()
  
  init() {
    super.init(frame: CGRect.zero)
    
    backgroundColor = .white
    
    addSubview(imageView)
    addSubview(textLabel)
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    
    imageView.contentMode = .scaleAspectFit
    
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 26).isActive = true
    textLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
    textLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

}
