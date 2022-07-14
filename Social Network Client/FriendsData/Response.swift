//
//  Response.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 14.07.2022.
//

import Foundation

struct Response<T: Codable>: Codable {
    let response: T
    
}

