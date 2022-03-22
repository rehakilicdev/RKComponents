//
//  Date+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 21.01.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import Foundation

public extension Date {
    var startOfDay: Date {
        return Calendar.UTCCalendar.startOfDay(for: self)
    }

    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        guard let date = Calendar.UTCCalendar.date(byAdding: components, to: startOfDay) else { preconditionFailure("Can not created date!") }
        return date
    }

    func daysBetween(date: Date) -> Int {
        let calendar = Calendar.current
        let endDate = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.day], from: self, to: endDate)
        return abs(components.day ?? 0)
    }
}

public extension Calendar {
    static var UTCCalendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        guard let timeZone = TimeZone(abbreviation: "UTC") else { preconditionFailure() }
        calendar.timeZone = timeZone
        return calendar
    }
}
