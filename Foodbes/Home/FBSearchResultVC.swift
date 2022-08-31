//
//  FBSearchResultVC.swift
//  Foodbes
//
//  Created by Ahmad Personal on 30/08/22.
//

import UIKit
import CHTCollectionViewWaterfallLayout

class FBSearchResultVC: UIViewController {
    @IBOutlet weak var resultCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionViewCell()
    }
    func setUpCollectionViewCell() {
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
        resultCollectionView.register(MenuItemCell.nib, forCellWithReuseIdentifier: MenuItemCell.identifier)
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        resultCollectionView.collectionViewLayout = layout
    }
}
extension FBSearchResultVC : UICollectionViewDelegate, UICollectionViewDataSource , CHTCollectionViewDelegateWaterfallLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCell.identifier, for: indexPath) as? MenuItemCell else {
            fatalError()
        }
        cell.setEmptySpace(isTrue: indexPath.row % 2 == 0)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 60
        if indexPath.row % 2 == 0 {
            return CGSize(width: width, height: 230)
        } else {
            return CGSize(width: width, height: 265)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("Item pressed at \(indexPath.row)")
    }
}
