//
//  AvatarImageView.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class AvatarImageView: UIImageView {
    let avatarPlaceholderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAvatarImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAvatarImageView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        clipsToBounds = true
        image = avatarPlaceholderImage
    }

    func downloadImage(from urlString: String) {
          
        guard let url = URL(string: urlString) else { return }
          
          URLSession.shared.dataTask(with: url) {  data, response, error in
              
              if error != nil { return }
              guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
              guard let data = data else { return }
              guard let image = UIImage(data: data) else { return }
              DispatchQueue.main.async { self.image = image }
          }.resume()
      }
    
}
