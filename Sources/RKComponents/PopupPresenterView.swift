//
//  PopupPresenterView.swift
//  RKFoundation
//
//  Created by Reha Kılıç on 5.09.2020.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public class PopupPresenterView: UIView {
    internal var containerView = UIView.make()
    private static let kAnimationDuration = 0.3

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        containerView.backgroundColor = .white
        containerView.alpha = 0
        layoutViews()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        containerView.round(corners: [.allCorners], radius: 10)
    }

    required internal init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    internal func animateStart(popupColor: UIColor) {
        UIView.animate(withDuration: PopupPresenterView.kAnimationDuration,
                       animations: {
                        self.backgroundColor = popupColor
                        self.containerView.alpha = 1
                        self.layoutIfNeeded()
        })
    }

    internal func animateFinish(then completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: PopupPresenterView.kAnimationDuration,
                       animations: {
                        self.backgroundColor = .clear
                        self.containerView.alpha = 0
                        self.layoutIfNeeded()
        }, completion: { _ in
            completion?()
        })
    }
}

private extension PopupPresenterView {
    func layoutViews() {
        addSubview(containerView)
        containerView.layout {
            $0.centerY == safeAreaLayoutGuide.centerYAnchor
            $0.leading == safeAreaLayoutGuide.leadingAnchor + DimensionConstant.Spacing.xxlarge
            $0.trailing == safeAreaLayoutGuide.trailingAnchor - DimensionConstant.Spacing.xxlarge
        }
    }
}

