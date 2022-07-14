//
//  ArrayWithData.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 14.07.2022.
//

import Foundation

struct FriendsArray: Codable {
    let id : Int
    let firstName: String
    let lastName: String
    let avatarPhoto: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarPhoto = "photo_200_orig"
    }
}
