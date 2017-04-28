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
	
	static let rssURL = URL(string: "http://antidote.dk/rss.xml")!
	
	static func getRSSItems(completion: @escaping RSSCompletionHandler) {
		FeedParser(URL: rssURL)?.parse({ (result) in
			
			var resultItems = [RSSItem]()
			if let items = result.rssFeed?.items {
				for item in items {
					if let rssTitle = item.title, let rssDescription = item.description, let rssLink = item.link {
						resultItems.append(RSSItem(title: rssTitle, description: rssDescription, link: rssLink))
					}
				}
			}
			
			completion(RSSItems(items: resultItems))
		})
	}
	
}
