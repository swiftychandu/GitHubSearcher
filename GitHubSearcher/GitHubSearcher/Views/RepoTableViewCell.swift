//
//  RepoTableViewCell.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/10/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    let repoNameLabel = UsernameLabel(frame: .zero)
    let forkslabel = UsernameLabel(frame: .zero)
    let starslabel = UsernameLabel(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupUI()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(repoNameLabel)
        contentView.addSubview(forkslabel)
        contentView.addSubview(starslabel)
        
        repoNameLabel.text = "This is repo label"
        forkslabel.text = "This is forks label"
        starslabel.text = "This is stars label"
        
        NSLayoutConstraint.activate([
            repoNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            repoNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            repoNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            repoNameLabel.widthAnchor.constraint(equalToConstant: 180),
            
            forkslabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            forkslabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            forkslabel.widthAnchor.constraint(equalToConstant: 80),
            forkslabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            starslabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            starslabel.topAnchor.constraint(equalTo: forkslabel.bottomAnchor),
            starslabel.widthAnchor.constraint(equalTo: forkslabel.widthAnchor),
            starslabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}
