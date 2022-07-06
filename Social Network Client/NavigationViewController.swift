//
//  NavigationViewController.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 05.07.2022.
//

import UIKit

class NavigationViewController: UINavigationController {

    @IBOutlet weak var iconGalleryCV: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let smsForBadgeValue = Notification.Name("smsForBadgeValue")
        NotificationCenter.default.addObserver(self, selector: #selector(getBadgeNumbers(notification:)), name: smsForBadgeValue, object: nil)
        
    }
    
    @objc func getBadgeNumbers(notification:Notification){
        
        let test = notification.object as? String
        let ttt : String = String(test!)
        iconGalleryCV.badgeValue = ttt
        
    }

}
