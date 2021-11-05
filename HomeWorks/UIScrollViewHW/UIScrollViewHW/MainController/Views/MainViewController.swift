//
//  MainViewController.swift
//  UIScrollViewHW
//
//  Created by Yunus Abubakarov on 04.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private var recipes: [String] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.view.backgroundColor = .red
    }

}

// MARK: - UITableView DataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(recipes.count)
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = recipes[indexPath.row]
        return cell
    }
}

//MARK: - MainContainerDelegate
extension MainViewController: MainContainerDelegate {
    func newCategorySelected(category: Categories) {
        self.recipes = category.recipesForCategory
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}

// MARK: Setup
private extension MainViewController {
    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
