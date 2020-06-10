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
        
    }
}
