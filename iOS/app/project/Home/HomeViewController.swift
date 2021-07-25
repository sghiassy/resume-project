//
//  ViewController.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/3/21.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {



    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .black
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .green
        scrollView.addSubview(contentView)

        let pageControlView = PageControlView()
        self.view.addSubview(pageControlView)
        pageControlView.translatesAutoresizingMaskIntoConstraints = false
        pageControlView.onTinderButtonPressed = { [weak scrollView] in
            scrollView?.scrollTo(horizontalPage: 1, animated: true)
        }
        pageControlView.onBeersButtonPressed = { [weak scrollView] in
            scrollView?.scrollTo(horizontalPage: 0, animated: true)
        }

        let vc1 = BeerViewController()
        vc1.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(vc1.view)
        addChild(vc1)
        vc1.didMove(toParent: self)

        let vc2 = BeerViewController()
        vc2.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(vc2.view)
        addChild(vc2)
        vc2.didMove(toParent: self)

        let viewDict:[String:UIView] = ["vc1":vc1.view, "vc2":vc2.view,"view":self.view, "scrollView":scrollView, "contentView":contentView, "pageControlView":pageControlView]
        let pageControlWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageControlView(==scrollView)]|", options:[], metrics:["t":Double(self.view.frame.size.width)], views:viewDict)
        let pageControlHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageControlView][vc1]|", options:[], metrics:["t":Double(self.view.frame.size.width)], views:viewDict)
        let scrollViewWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options:[], metrics:nil, views:viewDict)
        let scrollViewHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options:[], metrics:nil, views:viewDict)
        let contentViewWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:|[contentView]|", options:[], metrics:nil, views:viewDict)
        let contentViewHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:|[contentView(==scrollView)]|", options:[], metrics:nil, views:viewDict)

//        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[randomLabel]-[randomLabel2]-|", options:[], metrics:nil, views:viewDict)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[vc1(==scrollView)][vc2(==scrollView)]|", options: [.alignAllTop, .alignAllBottom], metrics: nil, views: viewDict)

        NSLayoutConstraint.activate(pageControlHeight + horizontalConstraints + pageControlWidth + scrollViewWidth + scrollViewHeight + contentViewWidth + contentViewHeight)



         /*



        let views:[String:UIView] = ["scrollView":scrollView, "page":pageControlView, "view":view, "vc1":vc1.view, "vc2":vc2.view]
        let topLevelVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[page][scrollView]|", options: [], metrics: nil, views: views)
        let pageControlWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:|[page(==view)]|", options: [], metrics: nil, views: views)
        let scrollViewWidth = NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView(==view)]|", options: [], metrics: nil, views: views)

        NSLayoutConstraint.activate(pageControlWidth + scrollViewWidth + topLevelVerticalConstraints + horizontalConstraints)
         */
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}
