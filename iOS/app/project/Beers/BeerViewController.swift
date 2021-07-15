//
//  BeerViewController.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/3/21.
//

import UIKit

class BeerViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var data:[BeerCollectionViewCell.ViewModel] = []
    var collectionView:UICollectionView!

    init() {
        super.init(nibName: nil, bundle: nil)
        self.fetchJSON()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fetchJSON() {
        guard let url = URL(string: "http://localhost:3000/json/beers.json") else { return }
        API.fetch(url) { [weak self] data in
            do {
                let res = try JSONDecoder().decode([BeerCollectionViewCell.ViewModel].self, from: data)
                DispatchQueue.main.async {
                    self?.data = res
                    self?.collectionView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.size.width, height: 200)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout:layout )
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
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! BeerCollectionViewCell
        cell.provide(data[indexPath.row], backgroundColor: indexPath.row&1==1 ? .red : .blue)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }

}
