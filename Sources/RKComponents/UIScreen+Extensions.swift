//
//  UIScreen+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 24.02.2020.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

extension UIScreen {

    public func animateBrightness(to newValue: CGFloat, duration: TimeInterval, ticksPerSecond: Double = 60) {
        guard duration > 0 else {
            UIScreen.main.brightness = newValue
            return
        }
        let startingBrightness = UIScreen.main.brightness
        let delta = newValue - startingBrightness
        let totalTicks = Int(ticksPerSecond * duration)
        let changePerTick = delta / CGFloat(totalTicks)
        let delayBetweenTicks = 1 / ticksPerSecond

        let time = DispatchTime.now()

        for i in 1...totalTicks {
            DispatchQueue.main.asyncAfter(deadline: time + delayBetweenTicks * Double(i)) {
                UIScreen.main.brightness = max(min(startingBrightness + (changePerTick * CGFloat(i)), 1), 0)
            }
        }
    }

}
