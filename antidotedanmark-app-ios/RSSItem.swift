//
//  RSSItem.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 27/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import Foundation

public struct RSSItem {
	public let title: String
	public let description: String
	public let link: String
	
	public init(title: String, description: String, link: String) {
		self.title = title
		self.description = description
		self.link = link
	}
}
