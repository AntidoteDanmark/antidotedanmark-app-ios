//
//  RSSHelper.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 28/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import Foundation
import FeedKit

class RSSHelper {
	
	typealias RSSCompletionHandler = (_ result: RSSItems?) -> Void
	
	static let rssEndpoint = "http://antidote.dk/rss.xml"
	
	static func getRSSItems(completion: @escaping RSSCompletionHandler) {
		guard let url = URL(string: rssEndpoint) else {
			print("Endpoint format invalid.")
			completion(nil)
			return
		}
		
		// Dispatch to another queue than main
		DispatchQueue.global().async {
			guard let feedParser = FeedParser(URL: url) else {
				print("Failed to create parser from endpoint.")
				completion(nil)
				return
			}
			
			let parseResult = feedParser.parse()
			
			var resultItems = [RSSItem]()
			if let items = parseResult.rssFeed?.items {
				for item in items {
					if let rssTitle = item.title, let rssDescription = item.description, let rssLink = item.link {
						resultItems.append(RSSItem(title: rssTitle, description: rssDescription, link: rssLink))
					}
				}
			}
			
			// Return to the main queue
			DispatchQueue.main.async {
				completion(RSSItems(items: resultItems))
			}
		}
		
	}
	
}
