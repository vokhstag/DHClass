//
//  MainContainerPresenter.swift
//  UIScrollViewHW
//
//  Created by Yunus Abubakarov on 05.11.2021.
//

import Foundation

struct MainContainerPresenter {
    
    var categories = Categories.allCases
    
    func categoryName(category: Categories) -> String {
        category.categoryName
    }
    
}
