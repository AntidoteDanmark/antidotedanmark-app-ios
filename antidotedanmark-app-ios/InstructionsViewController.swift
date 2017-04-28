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
	fileprivate var cellViewModels: [InstructionItemViewModel] = [] { didSet{ self.collectionView.reloadData() }}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Førstehjælp"
		self.automaticallyAdjustsScrollViewInsets = false
		
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UINib(nibName: "InstructionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellId)
		
		let item1 = InstructionItemViewModel(image: UIImage(named: "step01")!, title: "Tegn På Overdosis", description: "Ingen/svag vejrtrækning. \nBlå læber og negle. \nIngen reaktion. \nRÅB OM HJÆLP!", step: 1, maxStep: 6)
		let item2 = InstructionItemViewModel(image: UIImage(named: "step02")!, title: "Sikre Frie Luftveje", description: "Bøj hovedet tilbage og åben munden. \nLyt og føl efter vejrtrækning i max 10 sek. \nSe om brystet bevæger sig.", step: 2, maxStep: 6)
		let item3 = InstructionItemViewModel(image: UIImage(named: "step03")!, title: "Ingen Reaktion Ring 1–1–2", description: "ER DER NORMAL VEJRTRÆKNING? \nNEJ -> HJERTESTOP! -> GÅ TIL 4 + 5. \nJA -> GÅ TIL 6.", step: 3, maxStep: 6)
		let item4 = InstructionItemViewModel(image: UIImage(named: "step04")!, title: "Kunstigt Åndedræt + Hjertemassage", description: "Hjertemassage = 30 tryk \nIndblæsning = 2 forsøg \nGentag til hjælp kommer/normal vejrtrækning.", step: 4, maxStep: 6)
		let item5 = InstructionItemViewModel(image: UIImage(named: "step05")!, title: "Modgift Næsespray", description: "HJÆLP HINANDEN! \n1 ampul i hvert næsebor - hvis det ikke forsinker hjertemassage/indblæsninger ved hjertestop.", step: 5, maxStep: 6)
		let item6 = InstructionItemViewModel(image: UIImage(named: "step06")!, title: "Normal Vejrtrækning", description: "Læg personen på siden. \nSikre frie luftveje (2). \nGiv modgift ved tegn på overdosis. \nBliv til ambulancen kommer.", step: 6, maxStep: 6)
		cellViewModels.append(item1)
		cellViewModels.append(item2)
		cellViewModels.append(item3)
		cellViewModels.append(item4)
		cellViewModels.append(item5)
		cellViewModels.append(item6)
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
		let size = cellViewModels.count
		pageControl.numberOfPages = size
		return size
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! InstructionCollectionViewCell
		
		cell.configure(model: cellViewModels[indexPath.row])
		
		return cell
	}
	
}
