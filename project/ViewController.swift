//
//  ViewController.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/3/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray


        buildButton()
    }

    func buildButton() {
        let button = UIButton()
        button.setTitle("Beers", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1.0
        button.frame = self.view.frame
        self.view.addSubview(button)

        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }

    @objc func didTap() {
        print("Button was tapped")
    }

}
