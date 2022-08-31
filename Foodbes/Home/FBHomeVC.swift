//
//  FBHomeVC.swift
//  Foodbes
//
//  Created by Admin on 28/08/22.
//

import UIKit

struct MenuCategory {
    let itemName : String
    var isSelected : Bool
}
var menuData = [MenuCategory(itemName: "Foods", isSelected: false),
                MenuCategory(itemName: "Drinks", isSelected: true),
                MenuCategory(itemName: "Snacks", isSelected: true),
                MenuCategory(itemName: "Egg", isSelected: true),
                MenuCategory(itemName: "Momos", isSelected: true),
                MenuCategory(itemName: "Combos", isSelected: true),
                MenuCategory(itemName: "Meals", isSelected: true),
                MenuCategory(itemName: "Dessert", isSelected: true)]
                
                

class FBHomeVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var ItemCollectionView: UICollectionView!
    @IBOutlet weak var searchBar : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 30)
        ItemCollectionView.contentInset = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 30)
        ItemCollectionView.register(UINib(nibName: "MenuItemCell", bundle: nil), forCellWithReuseIdentifier: "MenuItemCell")
        searchBar.delegate = self
    }
    var selectedcell: ( (_ indexPath : IndexPath) -> Void)?
}

extension FBHomeVC: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView != ItemCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        cell.label.text = menuData[indexPath.row].itemName
        cell.selectedView.isHidden = menuData[indexPath.row].isSelected
        if !menuData[indexPath.row].isSelected {
            cell.label.textColor = #colorLiteral(red: 1, green: 0.2779999971, blue: 0.04300000146, alpha: 1)
        } else {
            cell.label.textColor = .gray
        }
        return cell
        } else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCell", for: indexPath) as! MenuItemCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for elementIndex in 0..<menuData.count {
            menuData[elementIndex].isSelected = true
        }
        menuData[indexPath.item].isSelected = false
        collectionView.reloadData()
    }
    

}


extension FBHomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView != ItemCollectionView {
        return CGSize(width: menuData[indexPath.item].itemName.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: collectionView.frame.height)
        }
        return CGSize(width: collectionView.frame.width / 1.8 - 30, height: collectionView.frame.height)
}
}

extension FBHomeVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "FBSearchResultVC") else { return }
        present(controller, animated: true)
    }
}

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedView.layer.applySketchShadow(color: UIColor(named: "selectedViewShadow") ?? UIColor(), alpha: 0.1, x: 0, y: 30, blur: 60, spread: 0)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.label.text = ""
        self.selectedView.isHidden = true
    }
}
