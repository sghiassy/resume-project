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
        self.view.backgroundColor = .purple
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.size.width, height: 200)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout:layout )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BeerCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .white

        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fetchJSON() {
        guard let url = URL(string: "http://localhost:3000/json/beers.json") else { return }
        API.Fetch.model(url, type:[BeerCollectionViewCell.ViewModel].self) { [weak self] res in
            DispatchQueue.main.async {
                self?.data = res
                self?.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Push fetching JSON to next run-loop, so that we give the UI more time to load
        DispatchQueue.main.async {
            self.fetchJSON()
        }
    }

    // MARK - UICollectionViewDataSource Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! BeerCollectionViewCell
        let model = data[indexPath.row]
        let backgroundColor:UIColor = indexPath.row.isOdd ? .red : .blue
        cell.provide(model, backgroundColor: backgroundColor)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }

}
