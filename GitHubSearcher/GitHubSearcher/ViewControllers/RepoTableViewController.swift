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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func configureTableView() {
          view.addSubview(tableView)
          tableView.backgroundColor = .systemBackground
          tableView.rowHeight = 120
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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RepoTableViewCell.self), for: indexPath)
        return cell
    }
    
    
}
