//
//  ViewController.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var tableView: UITableView!
    var searchController: UISearchController!
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        setUpSearchViewController()
        configureTableView()
        networkService.fetchUsers(for: "cha") { result in
            switch result {
            case .success(let users): print(users)
            case .failure(let error): print(error)
            }
        }
    }
    
    private func configureSearchController() {
        searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for a user on GitHub"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    private func setUpSearchViewController() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "GitHub Searcher"
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserCell.self, forCellReuseIdentifier: String(describing: UserCell.self))
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

