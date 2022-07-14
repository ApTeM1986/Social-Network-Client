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
          
        let request = RequestForGroup()
        request.creatingRequest()
    }
    

   
    @IBAction func searchInGroup(_ sender: Any) {
    let request = RequestForGroupSearch()
        request.creatingRequest()
        
    }
    
}
