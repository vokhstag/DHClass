//
//  ViewController.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 11.11.2021.
//

import UIKit

class MainViewController: BaseViewController {
    
    // MARK: - DI
    var presenter: MainViewPresenterProtocol!
    
    // MARK: - UI
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        isLoading = true
        presenter.getRecipes()
    }

}

// MARK: - UITableView DataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.configure(with: self.presenter.recipes[indexPath.row].strMeal ?? "")
        return cell
    }
}

// MARK: - UITableView Delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal = presenter.recipes[indexPath.row]
        presenter.goToDetail(meal: meal)
    }
}

extension MainViewController: MainViewProtocol {
    func succes() {
        tableView.reloadData()
        isLoading = false
    }
    
    func failure(errorDescription: String) {
        //
        isLoading = false
    }
    
    
}


// MARK: - Setup
private extension MainViewController {
    func setup() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

