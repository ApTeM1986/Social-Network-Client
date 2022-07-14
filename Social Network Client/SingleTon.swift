//
//  Data.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit





// SingleTon for user authorisation

class Session {
    
    static let shared = Session()
    private init(){}
    var token: String = ""
    var userId: Int = 6863663

}


