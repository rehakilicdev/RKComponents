//
//  ImageCacher.swift
//  RKFoundation
//
//  Created by Reha Kilic on 8.02.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public protocol Cache {
    associatedtype Object
    var items: [String: Object] { get }
    func set(value: Object, for key: String)
    func item(for key: String) -> Object?
}

public class ImageCacher: Cache {
    public typealias Object = UIImage
    public var items: [String: UIImage] = [:]

    public init() {}

    public func set(value: UIImage, for key: String) {
        items[key] = value
    }

    public func item(for key: String) -> UIImage? {
        return items[key]
    }
}
