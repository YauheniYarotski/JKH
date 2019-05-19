//
//  Extentions.swift
//  appWatchLocation
//
//  Created by Yauheni Yarotski on 5/4/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  private static let fadeTime = 0.16
  
  func roundCorners(corners:UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
  }
}

extension UIView {
  private struct AssociatedObject {
    static var key = "actionViewClosure"
  }
  
  var actionViewClosure: (()->())? {
    get {
      return objc_getAssociatedObject(self, &AssociatedObject.key) as? ()->Void
    }
    set {
      objc_setAssociatedObject(self, &AssociatedObject.key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView(sender:)))
      addGestureRecognizer(tap)
    }
  }
  
  @objc func didTapView(sender: UIView) {
    actionViewClosure?()
  }
  
  
    private static var _previousBounds = [String:CGRect]()
    
    var previousBounds:CGRect {
      get {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        return UIView._previousBounds[tmpAddress] ?? CGRect.zero
      }
      set(newValue) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        UIView._previousBounds[tmpAddress] = newValue
      }
    }
  

  
  
}

extension UIView {
  func makeVertical() {
    transform = transform.rotated(by: -CGFloat.pi / 2)
  }
}

extension CGFloat {
  func rad2deg() -> Double {
    return Double(self * 180 / .pi)
  }
}



//private var previousBounds = CGRect.zero

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
  
  static var backgroundColor: UIColor {
    return UIColor(rgb: 0xF7F7F7)
  }
}

