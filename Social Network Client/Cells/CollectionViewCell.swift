//
//  CollectionViewCell.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configurationCellForCollectionVC (photo: UIImage?) {
         
            imageView.image = photo
        }
    

}
