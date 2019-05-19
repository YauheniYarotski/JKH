//  Created by Yauheni Yarotski on 5/3/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import UIKit
import SnapKit


class UnderlinedTextField: UITextField {
	
  let lineView = UIView()
	var lineColor: UIColor? {
		get {
			return lineView.backgroundColor
		}
		set {
			lineView.backgroundColor = newValue
		}
	}
  
  
  var corners: UIRectCorner?
  var radius: CGFloat?
  
	var linedWidth: CGFloat = 1.0 {
		didSet {
			lineView.snp.updateConstraints { (make) in
				make.height.equalTo(linedWidth)
			}
			UIView.animate(withDuration: 0.15) {
				self.layoutIfNeeded()
			}
		}
	}
  
  var maxLenght: Int?
	
	var action: ((_ textField: UITextField)->())?
	
	override func becomeFirstResponder() -> Bool {
		textFieldFocused = canBecomeFirstResponder
		return super.becomeFirstResponder()
	}
	
	override func resignFirstResponder() -> Bool {
		textFieldFocused = false
		return super.resignFirstResponder()
	}
	
	var textFieldFocused: Bool = false {
		didSet {
      if lineView.isHidden {
        return
      }
			if textFieldFocused {
				linedWidth = 2
				lineColor = lineColor?.withAlphaComponent(1)
			} else {
				linedWidth = 1
				lineColor = lineColor?.withAlphaComponent(50)
			}
		}
	}
  
  var textInsets: UIEdgeInsets?
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    if let textInsets = textInsets {
      let rect = super.textRect(forBounds: bounds)
      return rect.inset(by: textInsets)
    } else {
      return super.textRect(forBounds: bounds)
    }
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    if let textInsets = textInsets {
      let rect = super.editingRect(forBounds: bounds)
      return rect.inset(by: textInsets)
    } else {
      return super.editingRect(forBounds: bounds)
    }
  }
	
	
	init() {
		super.init(frame: CGRect.zero)
		lineView.translatesAutoresizingMaskIntoConstraints = false
		lineView.backgroundColor = UIColor(rgb: 0x4867CD)
		tintColor = UIColor(rgb: 0x4867CD)
		addSubview(lineView)
		lineView.snp.makeConstraints { (make) in
			make.leading.trailing.equalToSuperview()
			make.bottom.equalToSuperview()
			make.height.equalTo(1)
		}
		
		addTarget(self, action: #selector(didAction(_:)), for: .allEditingEvents)
		delegate = self
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
  @objc func didAction(_ textField: UITextField) {
		action?(textField)
	}
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if bounds.size.height > 0 && bounds != previousBounds {
      previousBounds = bounds
      if let corners = corners {
        if corners.contains(.allCorners) {
          layer.cornerRadius = radius ?? bounds.size.height/2
        } else {
          roundCorners(corners: [corners], radius: radius ?? bounds.size.height/2)
        }
      }
//      didLayout?(bounds)
    }
  }

}

extension UnderlinedTextField: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool  {
    if let maxLenght = maxLenght {
      let currentCharacterCount = textField.text?.count ?? 0
      if (range.length + range.location > currentCharacterCount){
        return false
      }
      let newLength = currentCharacterCount + string.count - range.length
      return newLength <= maxLenght
    } else {
      return true
    }
    
  }
  
}
