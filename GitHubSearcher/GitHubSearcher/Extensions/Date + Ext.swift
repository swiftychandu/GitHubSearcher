//
//  Date + Ext.swift
//  GitHubSearcher
//
//  Created by chandrasekhar yadavally on 6/10/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

extension Date {
    func convertToMonthYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
