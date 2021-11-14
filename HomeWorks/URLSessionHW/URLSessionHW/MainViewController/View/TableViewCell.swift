//
//  TableViewCell.swift
//  URLSessionHW
//
//  Created by Yunus Abubakarov on 12.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }
    
    lazy var namelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        return label
    }()
    
    // MARK: - Constructor
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func configure(with mealName: String) {
        self.namelabel.text = mealName
    }
}

private extension TableViewCell {
    func setup() {
        NSLayoutConstraint.activate([
            namelabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            namelabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),            namelabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            namelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
