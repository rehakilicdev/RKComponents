//
//  AttributedStringBuilder.swift
//  RKFoundation
//
//  Created by Reha Kilic on 21.06.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import Foundation

public struct AttributedStringBuilder {
    public typealias Attributes = [NSAttributedString.Key: Any]
    private let attributedString = NSMutableAttributedString(string: "")

    public init() {}

    @discardableResult
    public func append(_ string: String, attributes: Attributes) -> AttributedStringBuilder {
        let addedString = NSAttributedString(
            string: string,
            attributes: attributes
        )
        attributedString.append(addedString)
        return self
    }

    @discardableResult
    public func append(attributedString string: NSAttributedString) -> AttributedStringBuilder {
        attributedString.append(string)
        return self
    }

    public func build() -> NSAttributedString {
        return NSAttributedString(attributedString: attributedString)
    }
}
