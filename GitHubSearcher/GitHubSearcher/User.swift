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
    
    enum CodingKeys: String, CodingKey {
        case login, id, url
        case avatarUrl = "avatar_url"
    }
}

struct UserDetails: Decodable {
    
    let login: String
    let avatarUrl: String
    let url: String
    let email: String?
    let location: String?
    let joinDate: String
    let followers: Int
    let following: Int
    let bio: String?
    let repoCount: Int
    let reposUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login, url, email, location, followers, following, bio
        case avatarUrl = "avatar_url"
        case joinDate = "created_at"
        case repoCount = "public_repos"
        case reposUrl = "repos_url"
    }
}

struct Repo: Decodable {
    let name: String
    let url: String
    let stars: Int
    let forks: Int
    
    enum CodingKeys: String, CodingKey {
        case name, url
        case stars = "stargazers_count"
        case forks = "forks_count"
    }
}
