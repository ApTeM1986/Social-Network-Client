//
//  FriendsViewController.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit
import WebKit

class FriendsViewController: UIViewController {
    

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let request = RequestForFriendsList()
        request.creatingRequest()
    
    }
    
}

