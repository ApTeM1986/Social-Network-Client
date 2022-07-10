//
//  ViewController.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: WKWebView! {
        didSet {
            loginView.navigationDelegate = self
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let loginRequest = LoginRequest()
        
        guard let url = loginRequest.requestList().url else { return }
        
        print (url)
        
        let request = URLRequest(url: url)
        loginView.load(request)
    
    }
   
}

extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
        return
        }

        let params = fragment
            .components(separatedBy: "&")
            .map {$0.components(separatedBy: "=")}
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key]=value
                return dict
            }

        let token = params ["access_token"]

        guard let token = token else { return }
        Session.shared.token = token
        
        performSegue(withIdentifier: "toNextScreen", sender: self)
        decisionHandler(.cancel)
    }
}
