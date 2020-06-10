//
//  RepoTableViewController.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/10/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class RepoTableViewController: UIViewController {
    let tableView = UITableView()
    let _repos: [Repo]
    var repos: [Repo] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(repos: [Repo]) {
        self._repos = repos
        self.repos = repos
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureTableView()
       configureSearchController()
    }
    
    private func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for user's repositories"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    private func configureTableView() {
          view.addSubview(tableView)
          tableView.backgroundColor = .systemBackground
          tableView.delegate = self
          tableView.dataSource = self
          tableView.translatesAutoresizingMaskIntoConstraints = false
          tableView.register(RepoTableViewCell.self, forCellReuseIdentifier: String(describing: RepoTableViewCell.self))
          
          NSLayoutConstraint.activate([
                    tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                ])
      }

}

extension RepoTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(type: RepoTableViewCell.self, reuseId: String(describing: RepoTableViewCell.self), indexPath: indexPath)
        let repo = repos[indexPath.row]
        cell.forkslabel.text = "\(repo.forks) Forks"
        cell.repoNameLabel.text = repo.name
        cell.starslabel.text = "\(repo.stars) Stars"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = repos[indexPath.row]
        guard let url = URL(string: repo.url) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension RepoTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}


extension RepoTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search(searchBar.text ?? "")
    }
    
    private func search(_ term: String) {
        guard term.isEmpty == false else { repos = _repos; return }
        let searchTerm = term.uppercased()
        repos = _repos.filter { $0.name.uppercased().contains(searchTerm) }
    }
}
