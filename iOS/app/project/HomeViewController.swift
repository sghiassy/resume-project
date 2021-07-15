//
//  ViewController.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/3/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        buildButton()
    }

    func buildButton() {
        let button = UIButton()
        button.setTitle("Beers", for: .normal)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            button.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    @objc func didTap() {
        print("Button was tapped")
        let beersViewController = BeerViewController()
        self.navigationController?.pushViewController(beersViewController, animated: true)
    }

}
