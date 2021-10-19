//
//  ViewController.swift
//  UIResponnderAndHitTestingHW
//
//  Created by Yunus Abubakarov on 13.10.2021.
//

import UIKit

class FirstHomeWorkViewController: UIViewController {
    
    var descriptionLabel = UILabel()
    var label = UILabel()
    var firstView = FirstView()
    var secondView = SecondView()
    
    private var tapNumbers = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupUI()
    }
}

//MARK: - Setup
extension FirstHomeWorkViewController {
    func setupUI() {
        setuplabels()
        setupFirstView()
        setupSecondView()
    }
    
    func setuplabels() {
        self.view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .black
        descriptionLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 16).isActive = true
        descriptionLabel.text = "Нажмите на синий круг или область вокруг него"
        
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
    }
    
    func setupFirstView() {
        self.view.addSubview(firstView)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = .blue
        
        firstView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 20).isActive = true
        firstView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        firstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        firstView.heightAnchor.constraint(equalTo: self.firstView.widthAnchor).isActive = true
        firstView.layer.cornerRadius = (self.view.bounds.width - 40)/2
        let tap = UITapGestureRecognizer(target: self, action: #selector(firstViewTapped))
        firstView.addGestureRecognizer(tap)
    }
    
    func setupSecondView() {
        self.view.addSubview(secondView)
        secondView.backgroundColor = .clear
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 60).isActive = true
        secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 60).isActive = true
        secondView.centerXAnchor.constraint(equalTo: firstView.centerXAnchor).isActive = true
        secondView.heightAnchor.constraint(equalTo: secondView.widthAnchor).isActive = true
        secondView.clipsToBounds = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(secondViewTapped))
        secondView.addGestureRecognizer(tap)
    }
    
    @objc func firstViewTapped() {
        tapNumbers += 1
        self.label.text = "\(tapNumbers) Тап на синий круг"
    }
    @objc func secondViewTapped() {
        tapNumbers = 0
        self.label.text = "Тап на красный"
    }
    
}

