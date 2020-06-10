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
                // decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users = try decoder.decode(SearchData.self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
    
    func getDetails(user: User, _ completion: @escaping (UserDetails?) -> Void) {
        guard let url = URL(string: user.url) else { completion(nil); return }
        
        completion(nil);
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { completion(nil); return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { completion(nil); return }
            guard let data = data else { completion(nil); return }
            do {
                let decoder = JSONDecoder()
                // decoder.keyDecodingStrategy = .convertFromSnakeCase
                let details = try decoder.decode(UserDetails.self, from: data)
                completion(details)
            } catch {
                completion(nil)
            }
        }.resume()
    }
    
    func getRepos(user: UserDetails, _ completion: @escaping ([Repo]) -> Void) {
        guard let url = URL(string: user.reposUrl) else { completion([]); return }
        
        completion([]);
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { completion([]); return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { completion([]); return }
            guard let data = data else { completion([]); return }
            do {
                let decoder = JSONDecoder()
                // decoder.keyDecodingStrategy = .convertFromSnakeCase
                let repos = try decoder.decode([Repo].self, from: data)
                completion(repos)
            } catch {
                completion([])
            }
        }.resume()
    }
}
