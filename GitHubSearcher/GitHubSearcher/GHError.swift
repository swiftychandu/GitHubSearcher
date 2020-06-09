//
//  ErrorMessage.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

enum GHError: String, Error {
    case nousers = "No users returned"
    case connectionError = "Connection Error. Please try again later"
    case invalidResponse = "Invalid Response. Please try again later"
    case invalidData = "Invalid data received. Please try again later"
    
}
