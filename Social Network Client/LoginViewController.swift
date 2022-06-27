//
//  ViewController.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextOulter: UITextField!
    @IBOutlet weak var passTextOutlet: UITextField!
 
    @IBOutlet weak var checkBoxOutlet: UIImageView!
    var pressed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        self.view.addGestureRecognizer(recognizer)
    }
    
    @objc func onTap(_ sender: Any) {
        self.view.endEditing(true)
    }
    @IBAction func pressedLoginButton(_ sender: Any) {
    }
    
    @IBAction func checkBoxButtonPressed(_ sender: Any) {
   if pressed == false {
            checkBoxOutlet.image = UIImage(systemName: "checkmark.square")
           pressed = true
       
      } else {
           checkBoxOutlet.image = UIImage(systemName: "square")
           pressed = false
       }
        
    
    
}
}
