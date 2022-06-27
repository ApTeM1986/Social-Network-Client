//
//  TableViewCell.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var imagePhoto: UIImageView!
    
    @IBOutlet weak var likeCounter: UILabel!
    
    var isPressed: Bool = false
    var counter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configureCell (photo: UIImage?, nameLabel: String, cityLabel: String){
        imagePhoto.image = photo
        friendName.text = nameLabel
        friendName.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) // #colorLiteral()
        cityName.text = cityLabel
        cityName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   // function for "likes"
    @IBAction func likeButtonPressed(_ sender: Any) {
        isPressed = !isPressed
        if isPressed {
            counter += 1
            likeCounter.text = String(counter)
        } else {
            counter -= 1
            likeCounter.text = String(counter)
        }
    }
}
