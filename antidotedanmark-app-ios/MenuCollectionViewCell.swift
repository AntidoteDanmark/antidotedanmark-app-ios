//
//  MenuCollectionViewCell.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 27/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	fileprivate var link: URL?
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension MenuCollectionViewCell {
	public func configure(model: RSSItem) {
		titleLabel.text = model.title
		link = URL(string: model.link)
	}
}
