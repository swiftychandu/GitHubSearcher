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
    let footerView = UIView()
    let userDetails: UserDetails
    let repos: [Repo]
    
    
    init(userDetails: UserDetails, repos: [Repo]) {
        self.userDetails = userDetails
        self.repos = repos
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        add(childVC: UINavigationController(rootViewController: RepoTableViewController(repos: self.repos)), to: footerView)
       
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    private func setupUI() {
    addSubviews(views: avatartImageView,usernameLabel,emailLabel,locationLabel,
                joinDateLabel,followerslabel,followingLabel,bioLabel,footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = userDetails.login
        emailLabel.text = userDetails.email
        locationLabel.text = userDetails.location
        joinDateLabel.text = userDetails.joinDate.convertToDisplayFormat()
        followerslabel.text = "\(userDetails.followers) Followers"
        followingLabel.text = "Following \(userDetails.following)"
        bioLabel.text = userDetails.bio
        
       
        let padding: CGFloat = 5
        let height: CGFloat = 30
        NSLayoutConstraint.activate([
        avatartImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        avatartImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
        avatartImageView.heightAnchor.constraint(equalToConstant: 120),
        avatartImageView.widthAnchor.constraint(equalToConstant: 140),
        
        usernameLabel.leadingAnchor.constraint(equalTo: avatartImageView.trailingAnchor, constant: 2 * padding),
        usernameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
        usernameLabel.topAnchor.constraint(equalTo: avatartImageView.topAnchor),
        usernameLabel.heightAnchor.constraint(equalToConstant: height),
        
        emailLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
        emailLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
        emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: padding),
        emailLabel.heightAnchor.constraint(equalToConstant: height),
        
        locationLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
        locationLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
        locationLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: padding),
        locationLabel.heightAnchor.constraint(equalToConstant: height),
        
        joinDateLabel.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
        joinDateLabel.trailingAnchor.constraint(equalTo: locationLabel.trailingAnchor),
        joinDateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: padding),
        joinDateLabel.heightAnchor.constraint(equalToConstant: height),
        
        followerslabel.leadingAnchor.constraint(equalTo: joinDateLabel.leadingAnchor),
        followerslabel.trailingAnchor.constraint(equalTo: joinDateLabel.trailingAnchor),
        followerslabel.topAnchor.constraint(equalTo: joinDateLabel.bottomAnchor, constant: padding),
        followerslabel.heightAnchor.constraint(equalToConstant: height),
        
        followingLabel.leadingAnchor.constraint(equalTo: followerslabel.leadingAnchor),
        followingLabel.trailingAnchor.constraint(equalTo: followerslabel.trailingAnchor),
        followingLabel.topAnchor.constraint(equalTo: followerslabel.bottomAnchor, constant: padding),
        followingLabel.heightAnchor.constraint(equalToConstant: height),
        
        bioLabel.leadingAnchor.constraint(equalTo: avatartImageView.leadingAnchor),
        bioLabel.topAnchor.constraint(equalTo: followingLabel.bottomAnchor, constant: padding),
        bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        bioLabel.heightAnchor.constraint(equalToConstant: 60),
        
        footerView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor),
        footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
    }

}
