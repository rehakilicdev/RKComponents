//
//  URLOpener.swift
//  RKFoundation
//
//  Created by Reha Kilic on 5.08.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public protocol URLOpenable {
    func canOpenURL(_ url: URL) -> Bool
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any], completionHandler completion: ((Bool) -> Void)?)
}

open class URLOpener {
    private let application: URLOpenable

    public init(application: URLOpenable) {
        self.application = application
    }

    open func openURL(url: URL, completion: ((Bool) -> Void)?) {
        if application.canOpenURL(url) {
            application.open(url, options: [:], completionHandler: completion)
        } else {
            completion?(false)
        }
    }
}
