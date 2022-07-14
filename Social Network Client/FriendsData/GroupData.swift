//
//  File.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 14.07.2022.
//

import Foundation

struct GroupData: Codable {
    let count: Int
    let items : [GroupsParams]
}
struct GroupsParams: Codable {
    let id: Int
    let groupName: String
    let groupPhoto: String
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case groupName = "name"
        case groupPhoto = "photo_200"
    }
}
