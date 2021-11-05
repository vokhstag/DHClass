//
//  Categories.swift
//  UIScrollViewHW
//
//  Created by Yunus Abubakarov on 05.11.2021.
//

import Foundation

enum Categories {
    case meat
    case salad
    case bakery
    case fish
    
    static var allCases: [Categories] {
        return [.meat, .salad, .bakery, .fish]
    }
    
    var categoryName: String {
        switch self {
        case .bakery: return "Выпечка"
        case .fish: return "Рыба"
        case .meat: return "Мясо"
        case .salad: return "Салаты"
        }
    }
    
    var recipesForCategory: [String] {
        switch self {
        case .bakery: return ["Выпечка 1", "Выпечка 2", "Выпечка 3", "Выпечка 4", "Выпечка 5", "Выпечка 6"]
        case .fish: return ["Рыбное блюдо 2", "Рыбное блюдо 3", "Рыбное блюдо 4", "Рыбное блюдо 5"]
        case .meat: return ["Мясное блюдо 1", "Мясное блюдо 2", "Мясное блюдо 3", "Мясное блюдо 4"]
        case .salad: return ["Салат 1", "Салат 2", "Салат 3", "Салат 4", "Салат 5", "Салат 6", "Салат 7"]
        }
    }
}
