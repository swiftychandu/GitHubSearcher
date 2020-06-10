//
//  UserInfoViewController.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    let headerView = UIView()
    let footerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        add(childVC: UserInfoHeaderVC(), to: headerView)
        add(childVC: RepoTableViewController(), to: footerView)
    }
    
    private func setupUI() {
        addSubviews(views: headerView, footerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .systemPink
        footerView.backgroundColor = .systemGreen
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.33),
            
            footerView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    

}
