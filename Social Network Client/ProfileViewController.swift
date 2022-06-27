//
//  ProfileViewController.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var collectionVC: UICollectionView!
    
    let reusebleCell = "reusebleCell"
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //settings for avatar image
        avatarImage.layer.borderWidth = 2
        avatarImage.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        // setting up reusable cell
        
        collectionVC.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reusebleCell)
        collectionVC.dataSource = self
        collectionVC.delegate = self
      
    }
    
    @IBAction func toLoginVC(_ sender: Any) {
    performSegue(withIdentifier: "exitSegue", sender: nil)
    }
    
}
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 55
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusebleCell, for: indexPath) as! CollectionViewCell
        
        //filling array with photos
        addPhototoArray()
        
        // configuring cell with self creating func
        cell.configurationCellForCollectionVC(photo: photoArrayProfile[indexPath.item])
        
        return cell
    }
    
    
}
