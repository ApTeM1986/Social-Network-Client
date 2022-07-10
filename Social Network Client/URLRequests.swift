//
//  URLRequests.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 09.07.2022.
//

import Foundation
import WebKit

class LoginRequest {
    
    func requestList () -> URLComponents {
        var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "oauth.vk.com"
            urlComponents.path = "/authorize"
            urlComponents.queryItems = [
                URLQueryItem(name: "client_id", value: "8214036"),
                URLQueryItem(name:"display", value: "mobile"),
                URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                URLQueryItem(name: "scope", value: "262150"),
                URLQueryItem(name: "response_type", value: "token"),
                URLQueryItem(name: "v", value: "5.13")
                ]
       return urlComponents
    }
}

class RequestForFriendsList {
    
    func listOfFriends () -> URLComponents {
        var urlListofFriends = URLComponents()
        urlListofFriends.scheme = "https"
        urlListofFriends.host = "api.vk.com"
        urlListofFriends.path = "/method/friends.get"
        urlListofFriends.queryItems = [
            URLQueryItem(name: "user_ids", value: String(Session.shared.userId)),
            URLQueryItem(name: "fields", value: "bdate"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
            ]
       return urlListofFriends
    }
}

// for Photo https://api.vk.com/method/photos.getAll?owner_id=6863663&fields=bdate&access_token=vk1.a.8sheUQs0yBIPv3FkVUFlKlZE5LdQWTfdt2DoyH2EEZKqw8JkE9UOZI3rxVBv7y_pC6MWV7XzCPEJ4DEbZ_q1vgxm_60wgYQy6fyZdQnDNcfnL_JZNvngz_KgaAwXQUl3JJgH7GvSUCa4CYYYfVzMt-xJlSb-j49llM_hu6XcEPJP2bSwO1fZ6W2W2fZ3AwzX&v=5.131

