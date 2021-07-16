//
//  PageControlView.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/15/21.
//

import UIKit



class PageControlView: UIStackView {

    var onTinderButtonPressed:(()->())? = nil

    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.distribution = .fillProportionally
        self.spacing = 5

        let beersButton = UIButton()
        beersButton.setTitle("Beers", for: .normal)
        beersButton.addTarget(self, action: #selector(beersButtonTapped), for: .touchUpInside)
        beersButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)

        let tinderButton = UIButton()
        tinderButton.setTitle("Tinder", for: .normal)
        tinderButton.addTarget(self, action: #selector(tinderButtonTapped), for: .touchUpInside)
        tinderButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)

        [beersButton, tinderButton].forEach { [weak self] view in
            view.layer.borderColor = UIColor.white.cgColor
            view.layer.borderWidth = 0.5
            self?.addArrangedSubview(view)
        }

        self.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }

    @objc func beersButtonTapped() {
        print("beersButtonTapped")
    }

    @objc func tinderButtonTapped() {
        onTinderButtonPressed?()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
