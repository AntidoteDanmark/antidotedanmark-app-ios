//
//  InstructionItem.swift
//  antidotedanmark-app-ios
//
//  Created by Casper Riboe on 27/04/2017.
//  Copyright © 2017 Criboe. All rights reserved.
//

import UIKit

public struct InstructionItem {
	public let image: UIImage
	public let title: String
	public let description: String
	public let step: Int
	public let maxStep: Int
	
	public init(image: UIImage, title: String, description: String, step: Int, maxStep: Int) {
		self.image = image
		self.title = title
		self.description = description
		self.step = step
		self.maxStep = maxStep
	}
}
