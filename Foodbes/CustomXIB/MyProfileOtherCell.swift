//
//  MyProfileOtherCell.swift
//  Foodbes
//
//  Created by Admin on 30/08/22.
//

import UIKit

class MyProfileOtherCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.applySketchShadow(color: .black, alpha: 0.03, x: 0, y: 10, blur: 40, spread: 0)
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
