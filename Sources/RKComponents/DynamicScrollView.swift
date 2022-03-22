//
//  DynamicScrollView.swift
//  DFDSComponent
//
//  Created by Reha Kılıç on 5.02.2019.
//  Copyright © 2019 DFDS. All rights reserved.
//

import UIKit

open class DynamicScrollView: UIScrollView {
    public lazy var contentView = UIView.make()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }

    public required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func layoutViews() {
        addSubview(contentView)
        contentView.layout {
            $0.fillIn(self)
            $0.width == widthAnchor
        }
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: heightAnchor)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority(rawValue: 750)
    }
}
