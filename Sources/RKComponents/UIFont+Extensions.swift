//
//  UIFont+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 7.01.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public extension UIFont {

    static func registerFont(withFilenameString filenameString: String, bundle: Bundle) {

        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            assertionFailure("UIFont+: Failed to register font - path for resource not found.")
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            assertionFailure("UIFont+: Failed to register font - font data could not be loaded.")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            assertionFailure("UIFont+: Failed to register font - data provider could not be loaded.")
            return
        }

        guard let font = CGFont(dataProvider) else {
            assertionFailure("UIFont+: Failed to register font - font could not be loaded.")
            return
        }

        var errorRef: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &errorRef) {
            print("UIFont+: Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }

}
