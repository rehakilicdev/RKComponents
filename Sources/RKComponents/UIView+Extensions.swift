//
//  UIView_Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 4.02.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public extension UIView {
    static func make() -> UIView {
        let view = UIView()
//        view.backgroundColor = .random
        return view
    }

    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }

        for subview in subviews {
            if let firstResponder = subview.firstResponder { return firstResponder }
        }

        return nil
    }

    func round(corners: UIRectCorner, radius: CGFloat) {
        let bezierPath = UIBezierPath(roundedRect: bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: radius, height: radius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        layer.mask = shapeLayer
    }
}
