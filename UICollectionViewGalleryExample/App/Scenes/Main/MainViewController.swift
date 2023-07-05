//
//  MainViewController.swift
//  UICollectionViewGalleryExample
//
//  Created by Ярослав on 05.07.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let collectionView: UICollectionView = {
        let layout: UICollectionViewCompositionalLayout = {
            let fraction: CGFloat = 1 / 4
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return UICollectionViewCompositionalLayout(section: section)
        }()
        
//        let layout: UICollectionViewFlowLayout = {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .vertical
//            layout.minimumLineSpacing = 2
//            layout.minimumInteritemSpacing = 2
//            layout.itemSize = CGSize(width: 175, height: 175)
//            layout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
//            return layout
//        }()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        setupDelegates()
        makeConstraints()
    }
}

private extension MainViewController {
    func setupScene() {
        title = "UICollectionView Example"
        view.addSubview(collectionView)
    }
    
    func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GalleryItemCell.self, forCellWithReuseIdentifier: GalleryItemCell.cellId)
    }
    
    func makeConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryItemCell.cellId, for: indexPath) as! GalleryItemCell
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! GalleryItemCell
        let cellBackgroundColor = cell.contentView.backgroundColor
        let detailsViewController = DetailsViewController()
        detailsViewController.view.backgroundColor = cellBackgroundColor
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
