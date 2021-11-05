//
//  ViewController.swift
//  UIScrollViewHW
//
//  Created by Yunus Abubakarov on 01.11.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    // MARK: - UI
    let stackView = UIStackView()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.backgroundColor = #colorLiteral(red: 0.8618097175, green: 0.8631474743, blue: 0.8241919949, alpha: 1)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    lazy var scrollContentView: UIView = {
        let view = UIView()
        self.scrollView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Логин"
        label.numberOfLines = 1
        return label
    }()
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Логин"
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        return textField
    }()
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Пароль"
        return label
    }()
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.backgroundColor = .white
        textField.textContentType = .password
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        return textField
    }()
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Можно вводить любые значения или ничего не вводить"
        label.numberOfLines = 0
        return label
    }()
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.scrollContentView.addSubview(button)
        button.addTarget(self, action: #selector(goToMaiController), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func goToMaiController() {
        let vc = MainContainerViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: Setup
private extension AuthorizationViewController {
    func setup() {
        setupScrollView()
        setupStackView()
        setupSubviews()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        scrollContentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(loginLabel)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(descriptionLabel)
        
        let margins = scrollContentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: scrollContentView.centerYAnchor, constant: -200),
            //    stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -300)
            ])
    }
    
    func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollContentView.heightAnchor.constraint(greaterThanOrEqualTo: self.view.heightAnchor)
            
        ])
        let yCenter = scrollContentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        let xCenter = scrollContentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        yCenter.priority = UILayoutPriority(rawValue: 750)
        xCenter.priority = UILayoutPriority(rawValue: 750)
    }
    
    func setupSubviews() {
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            logInButton.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 40),
            logInButton.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -40),
            logInButton.heightAnchor.constraint(equalToConstant: 48),
            logInButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -400)
        ])
        NSLayoutConstraint.activate([
            loginLabel.heightAnchor.constraint(equalToConstant: 30),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30),
            loginTextField.heightAnchor.constraint(equalToConstant: 48),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
        
    }
}
