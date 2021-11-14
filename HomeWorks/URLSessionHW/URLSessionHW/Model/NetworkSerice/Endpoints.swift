//
//  Endpoints.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 13.11.2021.
//

import Foundation

enum Endpoints {
    case recipes(category: String)
    
    var url: URL? {
        return URL(string: baseURL + path)
    }
}

private extension Endpoints {
    var baseURL: String {
        return "https://themealdb.com"
    }
    var path: String {
        switch self {
        case .recipes(let category):
            return "/api/json/v1/1/filter.php?c=\(category)"
        }
    }
}
