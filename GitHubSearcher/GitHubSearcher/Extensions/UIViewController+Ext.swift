//
//  UIViewController+Ext.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

extension UIViewController {
   func addSubviews(views: UIView...) {
      views.forEach(view.addSubview)
    }
}

extension UITableView {
    func dequeue<T: UITableViewCell>(type: T.Type, reuseId: String, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! T
    }
    
}
