//
//  Cell.swift
//  Complite
//
//  Created by Sergio on 10.05.23.
//

import UIKit

final class Cell: UICollectionViewCell {

    static let identifier = "cell"

    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let labelTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .todayListCellBackground
        //layer.cornerRadius = 8
        //clipsToBounds = true
        addSubview(button)
        addSubview(label)
        addSubview(labelTwo)

        NSLayoutConstraint.activate([
            button.leadingAnchor .constraint(equalTo: leadingAnchor, constant: 10),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),

            label.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 5),

            labelTwo.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 2),
            labelTwo.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 10)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
