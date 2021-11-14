//
//  BaseViewController.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 13.11.2021.
//

import UIKit

class BaseViewController: UIViewController {

    let spinnerVC = SpinnerViewController()
    
    var isLoading = false {
        didSet {
            guard oldValue != isLoading else { return }
            showSpinner(isShown: isLoading)
        }
    }
    
    private func showSpinner(isShown: Bool) {
        if isShown {
            addChild(spinnerVC)
            spinnerVC.view.frame = view.frame
            view.addSubview(spinnerVC.view)
            spinnerVC.didMove(toParent: self)
        } else {
            spinnerVC.willMove(toParent: self)
            spinnerVC.view.removeFromSuperview()
            spinnerVC.removeFromParent()
        }
    }

}
