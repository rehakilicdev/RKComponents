//
//  Optional+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 25.11.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import Foundation

public extension Optional where Wrapped == String {
    mutating func get(or expression: @autoclosure () -> String) -> String {
        guard let s = self else {
            let new = expression()
            self = new
            return new
        }
        return s
    }

    func getOrEmpty() -> String {
        guard let s = self else {
            return String()
        }
        return s
    }

    var isNilOrEmpty: Bool {
        return self?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
    }
}

public extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
