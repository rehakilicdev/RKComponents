//
//  TimeTraveller.swift
//  RKFoundation
//
//  Created by Reha Kilic on 29.10.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import Foundation

public class TimeTraveller {
    private var date = Date()

    public init() {}

    public func travel(by timeInterval: TimeInterval) {
        date = date.addingTimeInterval(timeInterval)
    }

    public func travel(byAdding component: Calendar.Component, value: Int, calendar: Calendar = .current) -> Date? {
        return calendar.date(byAdding: component, value: value, to: date)
    }

    public func generateDate() -> Date {
        return date
    }

    public enum Time {
        case aYear
    }
}
