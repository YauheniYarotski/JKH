//
//  ServiceSelectionInteractor.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/18/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import Foundation
import UIKit

class ServiceSelectionInteractor {
  
  private let services: [Service] = serviceNames.map({
    var service = Service(name:$0)
    service.image = UIImage(named: $0)
    return service
  })
  
  var amountOfServices: Int {
    return services.count
  }
  
  func service(for row:Int) -> Service {
    return services[row]
  }
}
