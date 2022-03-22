//
//  PopupPresenterViewController.swift
//  RKFoundation
//
//  Created by Reha Kılıç on 5.09.2020.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public final class PopupPresenterViewController: UIViewController {
    private(set) internal lazy var popupPresenterView = PopupPresenterView()
    private let contentViewController: UIViewController
    private let dismissHandler: (() -> Void)?
    private let backgroundColor: UIColor

    public init(contentViewController: UIViewController, dismissHandler: (() -> Void)? = nil, backgroundColor: UIColor) {
        self.contentViewController = contentViewController
        self.dismissHandler = dismissHandler
        self.backgroundColor = backgroundColor
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        super.loadView()
        view = popupPresenterView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        add(contentViewController, to: popupPresenterView.containerView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        popupPresenterView.addGestureRecognizer(tapGestureRecognizer)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        popupPresenterView.animateStart(popupColor: backgroundColor)
    }

    public func animateFinish(then completion: (() -> Void)? = nil) {
        popupPresenterView.animateFinish { completion?() }
    }

    @objc
    private func viewTapped() {
        animateFinish(then: dismissHandler)
    }
}

