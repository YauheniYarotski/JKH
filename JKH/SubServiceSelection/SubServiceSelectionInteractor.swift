//
//  ServiceSelectionInteractor.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/18/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import Foundation
import UIKit

class SubServiceSelectionInteractor {
  
  var selectedService: Service?
  var selectedSubServices = [SubService]()
  
  private var subServices: [SubService] {
    let subNames =  subServiceNames[self.selectedService?.name ?? ""] ?? [""]
    let subs: [SubService] = subNames.map({
      let sub = SubService(name:$0, price: 0)
      return sub
    })
    return subs
  }
  
    var amountOfSubServices: Int {
      return subServices.count
    }
  //
    func subService(for row:Int) -> SubService {
      return subServices[row]
    }
}
