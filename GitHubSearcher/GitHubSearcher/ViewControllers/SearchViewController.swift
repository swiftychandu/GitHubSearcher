//
//  ViewController.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    let tableView = UITableView()
    let networkService = NetworkService()
    var users: [User] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            details = [UserDetails?](repeating: nil, count: users.count)
        }
    }
    var details: [UserDetails?] = []
    var workItem: DispatchWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        setUpSearchViewController()
        configureTableView()
    }
    
    private func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for a user on GitHub"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    private func setUpSearchViewController() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "GitHub Searcher"
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserCell.self, forCellReuseIdentifier: String(describing: UserCell.self))
        
        NSLayoutConstraint.activate([
                  tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                  tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                  tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                  tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
              ])
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(type: UserCell.self, reuseId: String(describing: UserCell.self), indexPath: indexPath)
        let user = users[indexPath.row]
        cell.avatarImageView.downloadImage(from: user.avatarUrl)
        cell.usernameLabel.text = user.login
        self.fetchRepoCount(index: indexPath.row) { count in
            DispatchQueue.main.async {
                cell.repoCountLabel.text = "Repos: \(count)"
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let userDetails = details[indexPath.row] else { return }
        self.networkService.getRepos(user: userDetails) { [weak self] (repos) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                let infoVC = UserInfoHeaderVC(userDetails: userDetails, repos: repos)
                self.navigationController?.pushViewController(infoVC, animated: true)
            }
        }
    }
    
}

extension SearchViewController {
    func fetchRepoCount(index: Int, _ completion: @escaping (Int) -> Void) {
        if let details = self.details[index] {
            completion(details.repoCount); return
        }
        self.networkService.getDetails(user: self.users[index]) { details in
            self.details[index] = details
            completion(details?.repoCount ?? 0)
            return
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search(searchBar.text ?? "")
    }
    
    private func search(_ term: String) {
        guard term.isEmpty == false else { return }
        workItem?.cancel()
        let newWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            self.networkService.fetchUsers(for: term) { result in
                switch result {
                case .success(let searchData):
                    let users: [User] = searchData.items
                    self.users = users
                case .failure(let error):
                    print("TODO - handle error: \(error)")
                }
            }
        }
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 1.0, execute: newWorkItem)
        workItem = newWorkItem
    }
}
