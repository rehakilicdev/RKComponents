//
//  UIViewController+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 27.12.2018.
//  Copyright © 2018 RK. All rights reserved.
//

import UIKit

public extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func add(_ child: UIViewController, to containerView: UIView) {
        addChild(child)
        containerView.addSubview(child.view)
        child.view.layout { $0.fillIn(containerView) }
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }

    func makeBackButtonTitleEmpty() {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }

    func addTransition(duration: CFTimeInterval = 0.3, type: CATransitionType = .fade) {
        let transition = CATransition()
        transition.duration = duration
        transition.type = type
        view.layer.add(transition, forKey: nil)
    }
}
