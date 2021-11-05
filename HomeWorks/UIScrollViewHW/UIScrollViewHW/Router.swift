//
//  Router.swift
//  UIScrollViewHW
//
//  Created by Yunus Abubakarov on 01.11.2021.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController? { get set }
    
    func showAuthorizationVC()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func showAuthorizationVC() {
        let viewController = AuthorizationViewController()
        
        self.navigationController?.viewControllers = [viewController]
    }
}
