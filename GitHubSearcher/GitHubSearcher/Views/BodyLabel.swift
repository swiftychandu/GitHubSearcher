//
//  BodyLabel.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/9/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class BodyLabel: UILabel {

      override init(frame: CGRect) {
         super.init(frame: frame)
         configure()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.preferredFont(forTextStyle: .body)
        textColor = .systemRed
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
     }

}
