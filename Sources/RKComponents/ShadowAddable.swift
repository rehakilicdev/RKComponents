//
//  ShadowAddable.swift
//  RKFoundation
//
//  Created by Reha Kilic on 28.02.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public protocol ShadowAddable {
    func addShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat, scale: Bool)
}

public extension ShadowAddable where Self: UIView {
    func addShadow(color: UIColor = .black, opacity: Float = 0.5, offSet: CGSize = .zero, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
