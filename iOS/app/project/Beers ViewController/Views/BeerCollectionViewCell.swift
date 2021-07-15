//
//  BeerCollectionViewCell.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/3/21.
//

import UIKit

class BeerCollectionViewCell:UICollectionViewCell {

    let title:UILabel
    let imageView:UIImageView

    override init(frame:CGRect) {
        title = UILabel(frame: .zero)
        title.textAlignment = .center
        title.setContentHuggingPriority(.defaultHigh, for: .vertical)
        imageView = UIImageView(frame: .zero)
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 1.0
        imageView.contentMode = .scaleAspectFit

        let stackView = UIStackView(arrangedSubviews: [imageView, title])
        stackView.axis = .vertical
        super.init(frame: frame)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
        ])
    }

    func provide(_ model:BeerCollectionViewCell.ViewModel, backgroundColor:UIColor) {
        title.text = model.title
        self.backgroundColor = backgroundColor
        if let url = URL(string: model.imageURL) {
            API.fetch(url) { data in
                DispatchQueue.main.async { [weak self] in
                    kdebug_signpost_start(10, 0, 0, 0, 0)
                    self?.imageView.image = UIImage(data: data)
                    kdebug_signpost_end(10, 0, 0, 0, 0)
                }
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
