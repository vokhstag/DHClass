//
//  MainViewPresenter.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 11.11.2021.
//

import UIKit

protocol MainViewProtocol: class {
    func succes()
    func failure(errorDescription: String)
}

protocol MainViewPresenterProtocol {
    var recipes: [RecipesModel] { get }
    var router: Router { get set }
    
    func getRecipes()
    
    func goToDetail(meal: RecipesModel)
}

class MainViewPresenter: MainViewPresenterProtocol {
    var router: Router
    var network: RecipeNetworkSeviceProtocol
    var recipes: [RecipesModel] = []
    
    private weak var view: MainViewProtocol?
    private var endpoint = Endpoints.recipes(category: "Seafood")
    
    init(view: MainViewProtocol?, router: Router, network: RecipeNetworkSeviceProtocol) {
        self.view = view
        self.router = router
        self.network = network
    }
    
    func getRecipes() {
        guard let url = endpoint.url else {
            self.view?.failure(errorDescription: "Не правильный URL")
            return
        }
        network.getRecipes(url: url, completion: { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let recipes):
                    self.recipes = recipes.meals
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(errorDescription: error.message)
                }
            }
            
        })
    }
    
    func goToDetail(meal: RecipesModel) {
        router.detailController(meal: meal)
    }
}
