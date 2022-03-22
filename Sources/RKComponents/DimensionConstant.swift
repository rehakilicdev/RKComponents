//
//  DimensionConstant.swift
//  RKFoundation
//
//  Created by Reha Kilic on 10.04.2020.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public enum DimensionConstant {
    public enum Spacing {
        public static let xxsmall: CGFloat = 4
        public static let xsmall: CGFloat = 8
        public static let small: CGFloat = 12
        public static let medium: CGFloat = 16
        public static let large: CGFloat = 20
        public static let xlarge: CGFloat = 28
        public static let xxlarge: CGFloat = 48
        public static let xxxlarge: CGFloat = 72
    }
}

public extension DimensionConstant {
    enum ButtonHeight {
        public static let small: CGFloat = 40
        public static let medium: CGFloat = 44
        public static let large: CGFloat = 52
    }

    enum ButtonWidth {
        public static let medium: CGFloat = 280
    }

    enum SeparatorHeight {
        public static let small: CGFloat = 1
    }

    enum RowHeight {
        public static let small: CGFloat = 52
        public static let medium: CGFloat = 60
        public static let large: CGFloat = 76
        public static let xlarge: CGFloat = 100
    }

    enum HeaderHeight {
        public static let small: CGFloat = 40
        public static let medium: CGFloat = 50
        public static let large: CGFloat = 160
    }

    enum SegmentHeight {
        public static let medium: CGFloat = 56
    }

    enum SectionHeight {
        public static let medium: CGFloat = 20
    }
}
