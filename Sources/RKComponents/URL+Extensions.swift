//
//  URL+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 29.11.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import Foundation

public extension URL {
    func addOrUpdate(_ queryItems: [URLQueryItem]) -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return self }

        if components.queryItems.isNilOrEmpty {
            components.queryItems = queryItems
        } else {
            let queryItemsNames = queryItems.map { return $0.name }
            components.queryItems?.removeAll { queryItemsNames.contains($0.name) }
            components.queryItems?.append(contentsOf: queryItems)
        }

        return components.url ?? self
    }
}
