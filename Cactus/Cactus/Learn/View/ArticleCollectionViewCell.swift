//
//  ArticleCollectionViewCell.swift
//  Cactus
//
//  Created by Mac on 8/11/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var thumbnailImageView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 16
        cardView.layer.masksToBounds = true
        
        
        thumbnailImageView.layer.cornerRadius = 16
        thumbnailImageView.layer.masksToBounds = true
    }
    
    func configure (with article: Article) {
        titleLabel.text = article.title
        subtitleLabel.text = article.subtitle
    }
}
