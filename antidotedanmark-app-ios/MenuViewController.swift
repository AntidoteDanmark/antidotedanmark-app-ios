//
//  MenuViewController.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 27/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var firstHelpButton: UIButton!
	@IBOutlet weak var videoGuideButton: UIButton!
	fileprivate let cellId = "cellId";
	
	override func viewDidLoad() {
		super.viewDidLoad()		
		
		self.title = "Antidote Danmark"
		
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func firstAidButton(_ sender: Any) {
		self.navigationController?.pushViewController(InstructionsViewController(), animated: true)
	}

	@IBAction func videoGuideButton(_ sender: Any) {
		if let url = URL(string: "https://www.youtube.com/watch?v=K2BGJRLIEGY") {
			UIApplication.shared.openURL(url)
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
		let inset = collectionView.bounds.size.width * 0.05
		return UIEdgeInsets(top: inset, left: 0, bottom: inset, right: 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width: CGFloat = collectionView.bounds.size.width * 0.9
		let height: CGFloat = 64
		return CGSize(width: width, height: height)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCollectionViewCell
		
		return cell
	}

}

extension MenuViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
}
