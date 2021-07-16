//
//  PageControlView.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/15/21.
//

import UIKit



class PageControlView: UIStackView {

    private let beersButton = UIButton()
    private let tinderButton = UIButton()
    public var onTinderButtonPressed:(()->())? = nil
    public var onBeersButtonPressed:(()->())? = nil

    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.distribution = .fillProportionally
        self.spacing = 5

        beersButton.setTitle("Beers", for: .normal)
        beersButton.backgroundColor = .blue
        beersButton.addTarget(self, action: #selector(beersButtonTapped), for: .touchUpInside)
        beersButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)

        tinderButton.setTitle("Tinder", for: .normal)
        tinderButton.backgroundColor = .black
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
        beersButton.backgroundColor = .blue
        tinderButton.backgroundColor = .black
        onBeersButtonPressed?()
    }

    @objc func tinderButtonTapped() {
        beersButton.backgroundColor = .black
        tinderButton.backgroundColor = .blue
        onTinderButtonPressed?()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
