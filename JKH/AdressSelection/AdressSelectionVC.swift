//
//  AdressSelectionVC.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/19/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import UIKit

class AdressSelectionVC: UIViewController {
  
  let nextButton = GradientButton(gradient: GradientParameters.cardGradientParameters, frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 120, height: 50)))
  
  let backImageView = UIImageView(image: UIImage(named: "Map"))
  
  let cityTextField = TitledTextField()
  let streetTextField = TitledTextField()
  let houseTextField = TitledTextField()
  let houseBuildingTextField = TitledTextField()
  let apptTextField = TitledTextField()
  
  var nextCont: NSLayoutConstraint?
  
//  let

    override func viewDidLoad() {
        super.viewDidLoad()

      view.addSubview(backImageView)
      view.addSubview(nextButton)
      view.addSubview(cityTextField)
      view.addSubview(streetTextField)
      view.addSubview(houseTextField)
      view.addSubview(houseBuildingTextField)
      view.addSubview(apptTextField)
      
      backImageView.translatesAutoresizingMaskIntoConstraints = false
      backImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
      backImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
      backImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      backImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      backImageView.contentMode = .scaleAspectFill

      
      nextButton.translatesAutoresizingMaskIntoConstraints = false
      nextCont = nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
      nextCont?.isActive = true
      //    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
      nextButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
      nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
      
      nextButton.layer.shadowColor = UIColor.black.cgColor
      nextButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
      nextButton.layer.shadowOpacity = 0.3
      nextButton.layer.shadowRadius = 6
      nextButton.setTitle("Далее", for: .normal)
      
      nextButton.actionViewClosure = {
        let subVC = TimeSelectionVC()
        subVC.navigationItem.title = "Время оказания услуги"
        //      subVC.interactor.selectedSerrvice = service
        self.navigationController?.pushViewController(subVC, animated: true)
      }
      
      cityTextField.translatesAutoresizingMaskIntoConstraints = false
      cityTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55).isActive = true
      cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
      cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
      cityTextField.title = "Город"
      cityTextField.becomeFirstResponder()
      
      streetTextField.translatesAutoresizingMaskIntoConstraints = false
      streetTextField.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 55).isActive = true
      streetTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
      streetTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
      streetTextField.title = "Улица"
      
      houseTextField.translatesAutoresizingMaskIntoConstraints = false
      houseTextField.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 55).isActive = true
      houseTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
      houseTextField.title = "Дом"
      
      houseBuildingTextField.translatesAutoresizingMaskIntoConstraints = false
      houseBuildingTextField.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 55).isActive = true
      houseBuildingTextField.leadingAnchor.constraint(equalTo: houseTextField.trailingAnchor, constant: 20).isActive = true
      houseBuildingTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
      houseBuildingTextField.widthAnchor.constraint(equalTo: houseTextField.widthAnchor).isActive = true
      houseBuildingTextField.title = "Корпус"
      
      apptTextField.translatesAutoresizingMaskIntoConstraints = false
      apptTextField.topAnchor.constraint(equalTo: houseTextField.bottomAnchor, constant: 55).isActive = true
      apptTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
      apptTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true
      apptTextField.title = "Квартира"
      
      NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AdressSelectionVC {
  @objc func keyboardWillShow(notification: NSNotification) {
    if let info = notification.userInfo, let kbHeight = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height, let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
      updateTitleViewYPosition(bottomOffset: -kbHeight, animationDuration: duration)
    }
  }
  
  @objc func keyboardWillHide(notification: NSNotification) {
    if let info = notification.userInfo, let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
      updateTitleViewYPosition(bottomOffset: 0, animationDuration: duration)
    }
  }
  
  func updateTitleViewYPosition(bottomOffset: CGFloat, animationDuration: Double) {
  nextCont?.isActive = false
    nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomOffset + 30).isActive = true
    nextButton.updateConstraintsIfNeeded()
    UIView.animate(withDuration: animationDuration, animations: {
      if bottomOffset == 0 {
//        self.titleView.backgroundColor = .black
//        self.titleView.blurEffectView.alpha = 0
      } else {
//        self.titleView.backgroundColor = .clear
//        self.titleView.blurEffectView.alpha = 1
      }
      self.view.layoutIfNeeded()
    })
  }
}
