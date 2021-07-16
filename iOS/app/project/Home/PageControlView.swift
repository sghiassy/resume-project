//
//  PageControlView.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/15/21.
//

import UIKit

class PageControlView: UIStackView {

    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.distribution = .fillProportionally
        self.spacing = 5

        let beersButton = UIButton()
        beersButton.setTitle("Beers", for: .normal)
        beersButton.addTarget(self, action: #selector(beersButtonTapped), for: .touchUpInside)

        let tinderButton = UIButton()
        tinderButton.setTitle("Tinder", for: .normal)
        tinderButton.addTarget(self, action: #selector(tinderButtonTapped), for: .touchUpInside)

        [beersButton, UIView(), tinderButton].forEach { [weak self] view in
            view.layer.borderColor = UIColor.white.cgColor
            view.layer.borderWidth = 0.5

            self?.addArrangedSubview(view)
        }
    }

    @objc func beersButtonTapped() {
        print("beersButtonTapped")
    }

    @objc func tinderButtonTapped() {
        print("tinderButtonTapped")
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
