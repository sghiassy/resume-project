//
//  BeerViewController.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/3/21.
//

import UIKit

class BeerViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.size.width, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout:layout )
        collectionView.register(BeerCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .white

        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }

    // MARK - UICollectionViewDataSource Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! BeerCollectionViewCell
        let model = BeerCollectionViewCell.ViewModel(title: "\(indexPath.row)", backgroundColor: indexPath.row&1==1 ? .red : .blue)
        cell.provide(model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }

}
