//
//  LearnViewController.swift
//  Cactus
//
//  Created by Mac on 8/11/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
  
    let articlesStorage = ArticlesStorage()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Learn"
        collectionView.collectionViewLayout = layoutForCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articlesStorage.articles.count
    }
       
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "article_cell", for: indexPath) as! ArticleCollectionViewCell
        let article = articlesStorage.articles[indexPath.row]
        cell.configure(with: article)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articlesStorage.articles[indexPath.row]
        print("clicked \(article.title)")
    }
    
    func layoutForCollectionView () -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitem: item, count: 1)
   
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 16
        return UICollectionViewCompositionalLayout(section: section)
    }
}
