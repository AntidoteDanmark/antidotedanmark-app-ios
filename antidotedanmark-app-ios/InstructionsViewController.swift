//
//  InstructionsViewController.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 27/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var pageControl: UIPageControl!
	fileprivate let cellId = "cellId"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Førstehjælp"
		self.automaticallyAdjustsScrollViewInsets = false
		
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UINib(nibName: "InstructionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func pageControl(_ sender: Any) {
		let pageNumber = CGFloat(pageControl.currentPage)
		var rect: CGRect = collectionView.frame
		rect.origin.x = rect.size.width * pageNumber
		rect.origin.y = 0
		
		collectionView.scrollRectToVisible(rect, animated: true)
	}
	
}

extension InstructionsViewController: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return collectionView.bounds.size
	}
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
			pageControl.currentPage = Int(self.collectionView.contentOffset.x / self.collectionView.frame.size.width)
	}
	
}

extension InstructionsViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		let size = 6
		pageControl.numberOfPages = size
		return size
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! InstructionCollectionViewCell
		
		return cell
	}
	
}
