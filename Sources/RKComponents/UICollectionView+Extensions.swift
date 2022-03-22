//
//  UICollectionView+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kılıç on 21.11.2021.
//  Copyright © 2021 RK. All rights reserved.
//

import UIKit

public extension UICollectionView {
    /**
     Returns a cell previously registered in the collectionView and mapped to its concrete type.
     */
    func dequeueReusableCell<T: UICollectionViewCell>(withClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            preconditionFailure("Cell must be registered")
        }
        return cell
    }
}
