//
//  WebViewController.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 19/07/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
	
	@IBOutlet weak var webView: UIWebView!
	var url: String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		webView.delegate = self
		self.title = "Loading.."
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		guard let url = URL(string: url ?? "") else {
			dismiss(animated: true, completion: nil)
			return
		}
		
		let urlRequest = URLRequest(url: url)
		webView.loadRequest(urlRequest)
	}
	
	func webViewDidFinishLoad(_ webView: UIWebView) {
		self.title = webView.stringByEvaluatingJavaScript(from: "document.title")
	}
	
}
