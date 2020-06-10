//
//  User.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let id: Int
    let avatarUrl: String
    let url: String
    let htmlUrl: String
    let followersUrl: String
    let followingUrl: String
    
}
