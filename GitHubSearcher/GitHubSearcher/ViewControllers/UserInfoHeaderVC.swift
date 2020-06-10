//
//  UserInfoHeaderVC.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class UserInfoHeaderVC: UIViewController {
    let avatartImageView = AvatarImageView(frame: .zero)
    let usernameLabel = UsernameLabel()
    let emailLabel = UsernameLabel()
    let locationLabel = UsernameLabel()
    let joinDateLabel = UsernameLabel()
    let followerslabel = UsernameLabel()
    let followingLabel = UsernameLabel()
    let bioLabel = BodyLabel()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
