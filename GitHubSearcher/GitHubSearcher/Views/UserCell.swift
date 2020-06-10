//
//  UserCell.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    let avatarImageView = AvatarImageView(frame: .zero)
    let usernameLabel = UsernameLabel(frame: .zero)
    let repoCountLabel = RepoCountLabel(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(usernameLabel)
        self.contentView.addSubview(repoCountLabel)
        
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100.0),
            
            repoCountLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            repoCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            repoCountLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            
            usernameLabel.topAnchor.constraint(lessThanOrEqualTo: avatarImageView.topAnchor),
            usernameLabel.bottomAnchor.constraint(lessThanOrEqualTo: avatarImageView.bottomAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: repoCountLabel.leadingAnchor, constant: -padding)
            
        ])
        
    }
}
