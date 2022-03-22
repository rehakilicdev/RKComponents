//
//  LayoutProperty.swift
//  RKFoundation
//
//  Created by Reha Kilic on 28.12.2018.
//  Copyright © 2018 RK. All rights reserved.
//

import UIKit

public struct LayoutProperty<Anchor> {
    private let anchor: Anchor

    public init(anchor: Anchor) {
        self.anchor = anchor
    }
}

public extension LayoutProperty where Anchor: LayoutAnchor {
    func equal(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(equalTo: otherAnchor, constant: constant).isActive = true
    }

    func greaterThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant).isActive = true
    }

    func lessThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant).isActive = true
    }
}

public extension LayoutProperty where Anchor: LayoutDimension {
    func equal(to constant: CGFloat) {
        anchor.constraint(equalToConstant: constant).isActive = true
    }
}
