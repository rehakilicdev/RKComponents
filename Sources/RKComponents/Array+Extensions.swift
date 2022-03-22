//
//  Array+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 31.05.2019.
//  Copyright © 2020 RK. All rights reserved.
//

extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
}
