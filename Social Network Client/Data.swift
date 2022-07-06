//
//  Data.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit

struct Friends {
    var name: String
    var city: String
    var photo: UIImage?
}

var photoArrayProfile = [UIImage]()

func addPhototoArray() {
    for photo in 1...12 {
        photoArrayProfile.append(UIImage(named: "nature\(photo)")!)
    }
}

class Session {
    static let shared = Session()
    private init(){}
    var token: String?
    var userId: Int?
    
   
    
    
}
