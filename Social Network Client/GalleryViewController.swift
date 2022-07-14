//
//  GalleryViewController.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit

class GalleryViewController: UIViewController {

  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = UrlRequest()
        request.requestForPhoto()
        
    }
    


}


