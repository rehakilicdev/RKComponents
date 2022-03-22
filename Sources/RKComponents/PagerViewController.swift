//
//  PagerViewController.swift
//  DFDSComponent
//
//  Created by Reha Kilic on 13.03.2019.
//  Copyright © 2019 DFDS. All rights reserved.
//

import UIKit

public class PagerViewController: UIPageViewController {
    public let orderedViewControllers: [UIViewController]
    private let currentPageIndicatorTintColor: UIColor
    private let pageIndicatorTintColor: UIColor
    private let dotsHidden: Bool

    public init(viewControllers: [UIViewController],
                currentPageIndicatorTintColor: UIColor,
                pageIndicatorTintColor: UIColor,
                dotsHidden: Bool = false) {
        orderedViewControllers = viewControllers
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.dotsHidden = dotsHidden
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    internal required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        view.backgroundColor = .white
        configureUIPageControlApperance()
        setFirstViewController()
    }
}

private extension PagerViewController {
    func setFirstViewController() {
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    func viewControllerAt(_ index: Int) -> UIViewController? {
        return orderedViewControllers.indices.contains(index) ? orderedViewControllers[index] : nil
    }

    func configureUIPageControlApperance() {
        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [PagerViewController.self])
        appearance.pageIndicatorTintColor = pageIndicatorTintColor
        appearance.currentPageIndicatorTintColor = currentPageIndicatorTintColor
    }
}

extension PagerViewController: UIPageViewControllerDataSource {
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        return viewControllerAt(index - 1)
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        return viewControllerAt(index + 1)
    }

    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return dotsHidden ? 0 : orderedViewControllers.count
    }

    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let firstViewController = viewControllers?.first, let index = orderedViewControllers.firstIndex(of: firstViewController) {
            return index
        }
        return 0
    }
}
