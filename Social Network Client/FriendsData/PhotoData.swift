//
//  PhotoData.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 14.07.2022.
//

import Foundation

struct  PhotoGallery: Codable {
    let count: Int
    let items : [ItemsParams]
    
}

struct ItemsParams: Codable {
    let ownerId : Int
    let sizes : [PhotoParams]
    enum CodingKeys: String, CodingKey {
        case ownerId = "owner_id"
        case sizes = "sizes"
    }
    
}

struct PhotoParams: Codable {
    let height: Int
    let url: String
    let width: Int
}
