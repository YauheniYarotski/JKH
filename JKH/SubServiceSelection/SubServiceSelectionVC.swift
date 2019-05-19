//
//  SubServiceSelectionVC.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/18/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import UIKit

class SubServiceSelectionVC: UIViewController {
  
  let interactor = SubServiceSelectionInteractor()
  let nextButton = GradientButton(gradient: GradientParameters.cardGradientParameters, frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 120, height: 50)))
  
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(SubServiceSelectionCell.self, forCellReuseIdentifier:  SubServiceSelectionCell.generatedReuseIdentifier)
    tableView.rowHeight = 48
    view.backgroundColor = UIColor.backgroundColor
    tableView.backgroundColor = UIColor.backgroundColor
    tableView.clipsToBounds = false
    
    view.addSubview(tableView)
    view.addSubview(nextButton)
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.tableFooterView = UIView()
    tableView.allowsMultipleSelection = true
    
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
//    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    nextButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
    nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    nextButton.layer.shadowColor = UIColor.black.cgColor
    nextButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    nextButton.layer.shadowOpacity = 0.3
    nextButton.layer.shadowRadius = 6
    nextButton.layer.cornerRadius = 25
    nextButton.setTitle("Далее", for: .normal)

    nextButton.actionViewClosure = {
      let subVC = AdressSelectionVC()
      subVC.navigationItem.title = "Адрес оказания услуги"
//      subVC.interactor.selectedSerrvice = service
      self.navigationController?.pushViewController(subVC, animated: true)
    }
    
    
 
    
    
    
  }
  
  
}

extension SubServiceSelectionVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  interactor.amountOfSubServices
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SubServiceSelectionCell.generatedReuseIdentifier, for: indexPath) as! SubServiceSelectionCell
    let sub = interactor.subService(for: indexPath.row)
    cell.titleLabel.text = sub.name
    cell.contentView.backgroundColor = UIColor.backgroundColor
    
    cell.actionViewClosure = { [weak cell] in
      if let cell = cell {
        cell.isSelected = !cell.isSelected
        if cell.isSelected {
          self.interactor.selectedSubServices.append(sub)
        } else {
          if let i = self.interactor.selectedSubServices.firstIndex(where: {sub.name == $0.name}) {
            self.interactor.selectedSubServices.remove(at: i)
          }
        }
      }
      print(self.interactor.selectedSubServices.count)
      self.nextButton.isEnabled = self.interactor.selectedSubServices.count > 0
    }
    
    return cell
    
  }
  
  
}
