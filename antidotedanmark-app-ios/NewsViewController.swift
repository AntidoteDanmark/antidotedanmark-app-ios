//
//  NewsViewController.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 28/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import UIKit
import FeedKit

class NewsViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var textView: UITextView!
	
	var viewModel: RSSItemViewModel?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let model = viewModel {
			self.title = model.title
			imageView.image = UIImage(named: "rssItem")
			titleLabel.text = model.title
			textView.attributedText = htmlAttributedString(string: model.description)
			textView.textColor = .white
		}
	}
	
	func htmlAttributedString(string: String) -> NSAttributedString? {
		guard let data = string.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
		guard let html = try? NSMutableAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil) else { return nil }
		return html
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
}
