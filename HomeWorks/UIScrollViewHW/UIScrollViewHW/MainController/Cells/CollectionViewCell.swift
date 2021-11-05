//
//  CollectionViewCell.swift
//  UIScrollViewHW
//
//  Created by Yunus Abubakarov on 05.11.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        return label
    }()
    
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
}

// MARK: - Setup
private extension CollectionViewCell {
    func setup() {
        self.backgroundColor = .white
        setupLabel()
    }
    
    func setupLabel() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 3)
        ])
    }
}


