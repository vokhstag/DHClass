//
//  Router.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 11.11.2021.
//

import UIKit

protocol RouterProtocol {
    func initialViewController()
    func detailController(meal: RecipesModel)
}

class Router: RouterProtocol {
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func initialViewController() {
        let controller = MainViewController()
        let network = RecipeNetworkSevice()
        let presenter = MainViewPresenter(view: controller, router: self, network: network)
        controller.presenter = presenter
        navigationController.viewControllers = [controller]
    }
    
    func detailController(meal: RecipesModel) {
        let controller = DetailViewController()
        let network = ImageNetworkSevice()
        controller.network = network
        controller.meal = meal
        navigationController.pushViewController(controller, animated: true)
    }
}
