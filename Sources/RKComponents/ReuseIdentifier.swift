//
//  UITableViewCell+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 3.01.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: ReuseIdentifiable {

    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView: ReuseIdentifiable {

    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReuseIdentifiable {

    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
