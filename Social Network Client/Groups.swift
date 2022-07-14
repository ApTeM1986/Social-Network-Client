//
//  Groups.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 10.07.2022.
//

import UIKit

class Groups: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()         
        let request = UrlRequest()
        request.requestForGroups()
    }
    

   
    @IBAction func searchInGroup(_ sender: Any) {
    let request = UrlRequest()
        request.requestForGroupSearch()
        
    }
    
}
