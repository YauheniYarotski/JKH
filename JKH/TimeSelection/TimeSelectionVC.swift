//
//  TimeSelectionVC.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/19/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import UIKit

class TimeSelectionVC: UIViewController {
  
  let hotView = ImageViewWithTitle()
  let coldView = ImageViewWithTitle()
  
  let stack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = UIColor.backgroundColor
      
      view.addSubview(stack)
      stack.addArrangedSubview(hotView)
      stack.addArrangedSubview(coldView)
      
      stack.axis = .vertical
      stack.distribution = .fillEqually
//      stack.alignment = .top
      stack.spacing = 25
      
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
      stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
      stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
      stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25).isActive = true
      
      
      hotView.translatesAutoresizingMaskIntoConstraints = false
      hotView.imageView.image = UIImage(named: "bomb")
      hotView.textLabel.text = "Ближайшее"
      hotView.widthAnchor.constraint(equalTo: hotView.heightAnchor).isActive = true
      
      coldView.translatesAutoresizingMaskIntoConstraints = false
      coldView.imageView.image = UIImage(named: "calendar")
      coldView.textLabel.text = "Выбрать время"
      coldView.widthAnchor.constraint(equalTo: coldView.heightAnchor).isActive = true
      
//      hotView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
//      hotView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
//      hotView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
      
      
      
      
      
    }
    

}
