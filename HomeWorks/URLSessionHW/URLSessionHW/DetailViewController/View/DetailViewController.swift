//
//  DetailViewController.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 14.11.2021.
//

import UIKit

class DetailViewController: BaseViewController {
    
    // MARK: - DI
    var meal: RecipesModel! {
        didSet {
            configure()
        }
    }
    var network: ImageNetworkSeviceProtocol!
    
    // MARK: - UI
    lazy var imageView: UIImageView = {
        let imagView = UIImageView()
        self.view.addSubview(imagView)
        imagView.translatesAutoresizingMaskIntoConstraints = false
        return imagView
    }()
    
    lazy var mealNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        isLoading = true
    }

}

// MARK: - Setup
private extension DetailViewController {
    func setup() {
        self.view.backgroundColor = .white
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.imageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            self.mealNameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 20),
            self.mealNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.mealNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
    
    func configure() {
        guard let urlStr = meal.strMealThumb, let url = URL(string: urlStr) else {
            return
        }
        network.getImage(url: url) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                self.mealNameLabel.text = self.meal.strMeal ?? "AAAAA"
                switch result {
                case .success(let data):
                    self.imageView.image = UIImage(data: data)
                case .failure(let error):
                    print(error.message)
                }
            }
        }
    }
}
