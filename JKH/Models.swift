//
//  Models.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/18/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import Foundation
import UIKit

enum RequestStatus: String {
  case creating
  case processing
  case accepted
  case executing
  case executed
  case updateRequested
  case canceled
}

struct JkhRequest {
  var service: Service
  var subService: [SubService]
  var desiredDate: Date
  var isHot: Bool
  var finishDate: Date?
  var adress: Adress
  var comment: String
  var user: User
  var master: Master?
  var status: RequestStatus
  var finalCost: Double
  var rate: Double
  var aditionalWorks: [SubService]
}

struct Adress {
  var city: String
  var streetName: String
  var bildingNumber: Int
  var bildingBody: String
  var appartment: String
}

class Person {
  var name: String = ""
  var photo: UIImage = UIImage()
  var phoneNumber: Int = -99
  var score: Double = -99
}

class Master: Person {
  var primaryService: Service
  
  init(primaryService: Service) {
    self.primaryService = primaryService
    super.init()
    
  }
}

class User: Person {
  
}

struct Service {
  var name: String
  var image: UIImage?
  
  init(name: String) {
    self.name = name
  }
}

struct SubService {
  var name: String
  var price: Double
}
