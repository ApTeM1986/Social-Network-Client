//
//  URLRequests.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 09.07.2022.
//

import Foundation
import WebKit

class UrlRequest {
    
    func requestLogin () -> URLComponents {
        var urlList = URLComponents()
        urlList.scheme = "https"
        urlList.host = "oauth.vk.com"
        urlList.path = "/authorize"
        urlList.queryItems = [
                URLQueryItem(name: "client_id", value: "8214036"),
                URLQueryItem(name:"display", value: "mobile"),
                URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                URLQueryItem(name: "scope", value: "262150"),
                URLQueryItem(name: "response_type", value: "token"),
                URLQueryItem(name: "v", value: "5.13")
                ]
       return urlList
    }
    func requestForFriendList (){
        var urlList = URLComponents()
        urlList.scheme = "https"
        urlList.host = "api.vk.com"
        urlList.path = "/method/friends.get"
        urlList.queryItems = [
            URLQueryItem(name: "user_ids", value: String(Session.shared.userId)),
            URLQueryItem(name: "fields", value: "bdate"),
            URLQueryItem(name: "count", value: "10"),
            URLQueryItem(name: "fields", value: "photo_200_orig"),
            //URLQueryItem(name: "fields", value: "online"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
            ]

        guard let url = urlList.url else { return }
        print(url)
        let request = URLSession.shared
        request.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
           // print ("______________________________________________")
           // print (String(data: data, encoding: .utf8))
            do {
                let model = try? JSONDecoder().decode(Response<Friends>.self, from: data)
                print(model?.response.items)
            } catch {
                print(error)
            }
            
        }
        .resume()
    }

    func requestForPhoto () {
        var urlList = URLComponents()
        urlList.scheme = "https"
        urlList.host = "api.vk.com"
        urlList.path = "/method/photos.getAll"
        urlList.queryItems = [
            URLQueryItem(name: "owner_id", value: String(Session.shared.userId)),
            URLQueryItem(name: "fields", value: "bdate"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
            ]
    
        guard let url = urlList.url else { return }
        
        
        let request = URLSession.shared
        request.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            do {
                let model = try? JSONDecoder().decode(Response<PhotoGallery>.self, from: data)
                print(model?.response.items)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    func requestForGroups () {
        var urlList = URLComponents()
        urlList.scheme = "https"
        urlList.host = "api.vk.com"
        urlList.path = "/method/groups.get"
        urlList.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.shared.userId)),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "name"),
            URLQueryItem(name: "count", value: "10"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
            ]
        
        guard let url = urlList.url else { return }
        print(url)
        let request = URLSession.shared
        request.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            do {
                let model = try JSONDecoder().decode(Response<GroupData>.self, from: data)
                print(model.response)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    func requestForGroupSearch () {
        var urlList = URLComponents()
        urlList.scheme = "https"
        urlList.host = "api.vk.com"
        urlList.path = "/method/groups.search"
        urlList.queryItems = [
            //URLQueryItem(name: "user_id", value: String(Session.shared.userId)),
            URLQueryItem(name: "q", value: "Игры"),
            URLQueryItem(name: "count", value: "10"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
            ]
    
        guard let url = urlList.url else { return }
        
        let request = URLSession.shared
        request.dataTask(with: url) { data, _, _ in
            
            guard let data = data else { return }
            print ("______________________________________________")
            print (String(data: data, encoding: .utf8))
            let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            //print(json)
        }
        .resume()
    }
    
}
