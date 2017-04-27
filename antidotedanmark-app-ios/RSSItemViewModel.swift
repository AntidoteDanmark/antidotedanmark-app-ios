//
//  RSSItemViewModel.swift.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 27/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import Foundation

public struct RSSItemViewModel {
	public let title: String
	public let description: String
	public let link: URL
	
	public init(title: String, description: String, link: URL) {
		self.title = title
		self.description = description
		self.link = link
	}

}
