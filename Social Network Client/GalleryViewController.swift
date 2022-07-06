//
//  GalleryViewController.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionVC: UICollectionView!
    let reuseCell = "reuseCell"
    let badgeNumberOfPhotoInCollectionView = 19
  
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVC.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseCell)
        collectionVC.dataSource = self
        collectionVC.delegate = self
        let smsForBadgeValue = Notification.Name("smsForBadgeValue")
        NotificationCenter.default.post(name: smsForBadgeValue, object: badgeNumberOfPhotoInCollectionView)
    }
    


}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return badgeNumberOfPhotoInCollectionView
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCell, for: indexPath) as! CollectionViewCell
        cell.configurationCellForCollectionVC(photo: UIImage(named: "nature\(indexPath.item)"))
        
        //let cell2 = secondCollectionVC.dequeueReusableCell(withReuseIdentifier: reuseCell, for: indexPath) as! CollectionViewCell
        //cell2.configurationCellForCollectionVC(photo: UIImage(named: "nature\(indexPath.item)"))
        
    return cell
    }
}
