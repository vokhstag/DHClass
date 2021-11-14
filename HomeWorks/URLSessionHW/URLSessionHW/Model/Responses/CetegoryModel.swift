//
//  CetegoryModel.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 11.11.2021.
//

import Foundation

struct CetegoryModel: Decodable {
    let idCategory: Int
    let strCategory: String
    let strCategoryThumb: String?
    let strCategoryDescription: String?
}
