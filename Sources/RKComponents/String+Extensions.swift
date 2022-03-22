//
//  String+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 14.11.2019.
//  Copyright © 2020 RK. All rights reserved.
//

extension String {
    public func convertHourToInt() -> Int {
        return Int(self.replacingOccurrences(of: ":", with: "")) ?? 0
    }
}
