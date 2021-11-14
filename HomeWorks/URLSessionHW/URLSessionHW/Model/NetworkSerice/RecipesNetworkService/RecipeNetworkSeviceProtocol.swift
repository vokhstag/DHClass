//
//  RecipeNetworkSeviceProtocol.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 13.11.2021.
//

import Foundation

typealias GetRecipesResponce = Result<Meals, NetworkServiceError>

protocol RecipeNetworkSeviceProtocol {
    func getRecipes(url: URL, completion: @escaping (GetRecipesResponce)-> Void)
}
