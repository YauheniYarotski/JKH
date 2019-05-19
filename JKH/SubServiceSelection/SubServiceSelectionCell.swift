//
//  SubServiceSelectionCell.swift
//  JKH
//
//  Created by Yauheni Yarotski on 5/18/19.
//  Copyright © 2019 Yauheni Yarotski. All rights reserved.
//

import UIKit

class SubServiceSelectionCell: UITableViewCell {
  
  
  let titleLabel = UILabel()
  

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(titleLabel)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    
    titleLabel.textAlignment = .left
    titleLabel.numberOfLines = 1
    titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
    //    titleLabel
    
  
    
//    contentView.layer.shadowColor = UIColor.black.cgColor
//    contentView.layer.shadowOffset = CGSize(width: 1, height: 2)
//    contentView.layer.shadowOpacity = 0.2
//    contentView.layer.shadowRadius = 4
//    contentView.layer.cornerRadius = 4
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    if selected {
      titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
      titleLabel.textColor = UIColor(rgb: 0x4E66CB)
    } else
    {
      titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
      titleLabel.textColor = .black
    }
    // Configure the view for the selected state
  }

}

extension UITableViewCell {
  static var generatedReuseIdentifier: String {
    return String(describing: self)
  }
}
