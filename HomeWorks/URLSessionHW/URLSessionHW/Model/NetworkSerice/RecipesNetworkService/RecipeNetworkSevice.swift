//
//  RecipeNetworkSevice.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 11.11.2021.
//

import Foundation

class RecipeNetworkSevice: BaseNetworkService, RecipeNetworkSeviceProtocol {
    
    func getRecipes(url: URL, completion: @escaping (GetRecipesResponce) -> Void) {
        let handler: Handler = { rawData, response, error in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
                let response = try self.decoder.decode(Meals.self, from: data)
                completion(.success(response))
            } catch(let error) {
                completion(.failure((error as? NetworkServiceError) ?? .decode))
            }
        }

        session.dataTask(with: url, completionHandler: handler).resume()
    }
}
