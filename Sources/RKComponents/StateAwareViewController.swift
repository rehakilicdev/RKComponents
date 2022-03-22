//
//  StateAwareViewController.swift
//  RKFoundation
//
//  Created by Reha Kılıç on 26.05.2020.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public protocol Reloadable {
    var reloadHandler: () -> Void { get set }
}

public final class StateAwareViewController: UIViewController {
    private(set) public var state: State?
    private(set) public var currentViewController: UIViewController?
    private(set) public var loadingViewController: UIViewController
    private(set) public var errorViewController: UIViewController & Reloadable

    public init(loadingViewController: UIViewController, errorViewController: UIViewController & Reloadable) {
        self.loadingViewController = loadingViewController
        self.errorViewController = errorViewController
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public override func viewDidLoad() {
        super.viewDidLoad()
        if state == nil {
            transition(to: .loading)
        }
    }

    public func transition(to newState: State) {
        currentViewController?.remove()
        let controller = viewController(for: newState)
        add(controller, to: view)
        currentViewController = controller
        state = newState
    }
}

public extension StateAwareViewController {
    enum State {
        case loading
        case failed
        case render(UIViewController)
    }
}

extension StateAwareViewController.State: Equatable {}

private extension StateAwareViewController {
    func viewController(for state: State) -> UIViewController {
        switch state {
        case .loading:
            return loadingViewController
        case .failed:
            return errorViewController
        case .render(let controller):
            return controller
        }
    }
}

