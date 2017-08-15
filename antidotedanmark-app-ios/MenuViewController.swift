//
//  MenuViewController.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 27/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

	@IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var firstHelpButton: UIButton!
	@IBOutlet weak var videoGuideButton: UIButton!
	fileprivate let cellId = "cellId";
	fileprivate var cellViewModels: [RSSItemViewModel] = [] { didSet { self.collectionView.reloadData() } }
	
	override func viewDidLoad() {
		super.viewDidLoad()		
		
		self.title = "Antidote Danmark"
		
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
		
		let logoRecognizer = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.visitWebsite))
		imageView.addGestureRecognizer(logoRecognizer)
		imageView.isUserInteractionEnabled = true
		
		loadData()
	}
	
	@IBAction func firstHelpButton(_ sender: Any) {
		self.performSegue(withIdentifier: "instructionsSegue", sender: nil)
	}

	@IBAction func videoGuideButton(_ sender: Any) {
		openURL("http://www.youtube.com/watch?v=K2BGJRLIEGY")
	}
	
	func loadData() {
		loadingIndicator.startAnimating()
		loadingIndicator.isHidden = false
		
		RSSHelper.getRSSItems { (item) in
			guard let items = item else {
				return
			}
			var viewModels = [RSSItemViewModel]()
			for item in items.items {
				viewModels.append(RSSItemViewModel(title: item.title, description: item.description, link: item.link))
			}
			self.cellViewModels = viewModels
			
			self.loadingIndicator.stopAnimating()
			self.loadingIndicator.isHidden = true
		}
	}
	
	func visitWebsite() {
		openURL("http://www.antidote.dk")
	}
	
	func openURL(_ url: String) {
		self.performSegue(withIdentifier: "newsWebSegue", sender: url)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "newsSegue" {
			if let vc = segue.destination as? NewsViewController {
				vc.viewModel = sender as? RSSItemViewModel
			}
		} else if segue.identifier == "newsWebSegue" {
			if let vc = segue.destination as? WebViewController {
				guard let url = sender as? String else {
					return
				}
				
				vc.url = url
			}
		}
	}
	
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return collectionView.bounds.size.width * 0.05
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let inset = collectionView.bounds.size.width * 0.04
		return UIEdgeInsets(top: inset, left: 0, bottom: inset, right: 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width: CGFloat = collectionView.bounds.size.width * 0.92
		let height: CGFloat = 68
		return CGSize(width: width, height: height)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCollectionViewCell
		
		cell.configure(model: cellViewModels[indexPath.row])
		
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		openURL(cellViewModels[indexPath.row].link)
	}
	
}

extension MenuViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cellViewModels.count
	}
	
}
