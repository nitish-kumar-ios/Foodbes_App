//
//  MenuItemCell.swift
//  Foodbes
//  Created by Admin on 28/08/22.
//

import UIKit

class MenuItemCell: UICollectionViewCell {
    func setEmptySpace(isTrue : Bool) {
        upperOutlet.constant = isTrue ? 5 : 40
    }
    class var identifier : String { return String(describing: self)}
    class var nib : UINib { return UINib(nibName: identifier, bundle: nil)}
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var upperOutlet : NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        itemView.layer.applySketchShadow(color: UIColor(named: "iteamViewShadowColor") ?? UIColor(), alpha: 0.1, x: 0, y: 30, blur: 60, spread: 0)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        itemImage.cornerRadius = itemImage.frame.width / 2
    }
}
