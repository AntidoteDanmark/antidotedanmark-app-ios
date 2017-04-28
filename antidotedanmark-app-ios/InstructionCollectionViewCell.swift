//
//  InstructionCollectionViewCell.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 27/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import UIKit

class InstructionCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var pageLabel: UILabel!
	@IBOutlet weak var descriptionView: UITextView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension InstructionCollectionViewCell {
	public func configure(model: InstructionItemViewModel) {
		imageView.image = model.image
		titleLabel.text = model.title
		pageLabel.text = model.step
		descriptionView.text = model.description
	}
}
