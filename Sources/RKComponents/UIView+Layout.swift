//
//  UIView+Layout.swift
//  RKFoundation
//
//  Created by Reha Kilic on 28.12.2018.
//  Copyright © 2018 RK. All rights reserved.
//

import UIKit

public extension UIView {
    func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
}
