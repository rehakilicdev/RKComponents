//
//  CGFloat+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 20.03.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

extension CGFloat {
    public func toRadians() -> CGFloat {
        return self * .pi / 180.0
    }
}
