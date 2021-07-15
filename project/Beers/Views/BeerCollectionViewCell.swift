//
//  BeerCollectionViewCell.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/3/21.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {

    struct ViewModel {
        let title:String
        let backgroundColor:UIColor
    }

    var textLabel:UILabel

    override init(frame:CGRect) {
        textLabel = UILabel(frame: .zero)
        super.init(frame: frame)


        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
        ])
    }

    func provide(_ model:ViewModel) {
        textLabel.text = model.title
        self.backgroundColor = model.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
