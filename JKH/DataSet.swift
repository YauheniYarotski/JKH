//
//  DataSet.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/18/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import Foundation
import UIKit

let serviceNames = ["Электрика","Сантехника","Строительные работы","Уборка"]
let serviceImages: [UIImage] = {
  var serviceImages = [UIImage]()
  for serviceName in serviceNames {
    serviceImages.append(UIImage(named: serviceName)!)
  }
  return serviceImages
}()


let subServiceNames = [serviceNames[0]:electricitySubServiceNames]

let electricitySubServiceNames = ["Консультация специалиста", "Замена розетки", "Замена выключателя", "Замена люстры", "Установка новой розетки", "Разводка электросети", "Замена автомата", "Поиск причины перепада напряжения в электросети квартиры", "Другая услуга"]














