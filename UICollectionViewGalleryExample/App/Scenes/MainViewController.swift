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
            let fraction: CGFloat = 1 / 3
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return UICollectionViewCompositionalLayout(section: section)
        }()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeConstraints()
    }
}

private extension MainViewController {
    func setupScene() {
        title = "UICollectionView Example"
        view.addSubview(collectionView)
    }
    
    func makeConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
