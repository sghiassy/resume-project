//
//  ViewController.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/3/21.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {

    let scrollView = UIScrollView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .black
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
//        scrollView.contentSize = CGSize(width: self.view.frame.size.width*2, height: self.view.frame.size.height-100)
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])

        let pageControlView = PageControlView()
        self.view.addSubview(pageControlView)
        pageControlView.translatesAutoresizingMaskIntoConstraints = false

        let vc1 = BeerViewController()
        vc1.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(vc1.view)
        addChild(vc1)
        vc1.didMove(toParent: self)

        let vc2 = BeerViewController()
        vc2.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(vc2.view)
        addChild(vc2)
        vc2.didMove(toParent: self)

        let views:[String:UIView] = ["page":pageControlView, "view":view, "vc1":vc1.view, "vc2":vc2.view]
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[page][vc1(==view)]", options: [], metrics: nil, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[vc1(==view)][vc2(==view)]|", options: [.alignAllTop, .alignAllBottom], metrics: nil, views: views)
        NSLayoutConstraint.activate(verticalConstraints + horizontalConstraints)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
