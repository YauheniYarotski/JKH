//
//  TitledTextField.swift
//  goDonate
//
//  Created by Yauheni Yarotski on 8/17/17.
//  Copyright © 2017 KRIT. All rights reserved.
//

import UIKit

class TitledTextField: UnderlinedTextField {

	struct constants {
		static let titleFont = UIFont.systemFont(ofSize: 12)
		static let mainFont = UIFont.systemFont(ofSize: 18)
	}
	
	private let titleLabel = UILabel()
	var title = "" {
		didSet {
			titleLabel.text = title
		}
	}
  
  override var text: String? {
    didSet {
      textFieldFocused = (text?.count ?? 0) > 0
    }
  }
  
  var customPlaceHolder: String?
  
  var color: UIColor = .black {
    didSet {
      textColor = color
      tintColor = color
      titleLabel.textColor = color
      lineColor = color
    }
  }
	
	override init() {
		super.init()
		
		textColor = UIColor.black
		font = constants.mainFont
		
    titleLabel.textColor = UIColor.black.withAlphaComponent(50)
		titleLabel.font = constants.titleFont
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(titleLabel)
		textFieldFocused = false
	}
	
	override var textFieldFocused: Bool {
		didSet {
      if lineView.isHidden {
        return
      }
			if textFieldFocused || text?.characters.count ?? 0 > 0 {
				titleLabel.snp.remakeConstraints { (make) in
					make.leading.equalToSuperview()
					make.centerY.equalToSuperview().offset(-24)
				}
        placeholder = customPlaceHolder
			} else {
				titleLabel.snp.remakeConstraints { (make) in
					make.leading.equalToSuperview()
					make.centerY.equalToSuperview()
				}
        placeholder = ""
			}
			UIView.animate(withDuration: 0.15) {
				self.layoutIfNeeded()
			}
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
