//
//  NetworkService.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

class NetworkService {
    let searchUrl = "https://api.github.com/search/users?q="
    
    func fetchUsers(for query: String, completion: @escaping (Result<SearchData, GHError>) -> Void) {
        let endPoint = searchUrl + query
        print("End Point: \(endPoint)")
        guard let url = URL(string: endPoint) else { completion(.failure(.nousers)); return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { completion(.failure(.invalidResponse)); return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else { completion(.failure(.invalidData)); return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users = try decoder.decode(SearchData.self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
}
