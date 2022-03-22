//
//  DynamicKeyboardViewController.swift
//  DFDSComponent
//
//  Created by Reha Kılıç on 5.03.2019.
//  Copyright © 2019 DFDS. All rights reserved.
//
import UIKit

// https://developer.apple.com/library/archive/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html
public final class KeyboardAwareViewController: UIViewController {
    private var scrollView: UIScrollView
    private let viewController: UIViewController

    public init(viewController: UIViewController, scrollView: UIScrollView? = nil) {
        self.viewController = viewController
        guard let scrollView = scrollView else {
            preconditionFailure("No Scroll View found!")
        }
        self.scrollView = scrollView
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(KeyboardAwareViewController.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(KeyboardAwareViewController.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        add(viewController, to: view)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func scrollIfActiveTextfieldIsHiddenByKeyboard(_ keyboardSize: CGSize, _ currentResponder: UIView) {
        // If active text field is hidden by keyboard, scroll it so it's visible
        // Your app might not need or want this behavior.
        var aRect = view.frame
        aRect.size.height -= keyboardSize.height
        if !aRect.contains(currentResponder.frame.origin) {
            self.scrollView.scrollRectToVisible(currentResponder.frame, animated: true)
        }
    }

    @objc
    internal func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey],
            let keyboardSize = (keyboardFrame as AnyObject).cgRectValue?.size,
            let currentResponder = scrollView.firstResponder else { return }

        setScrollInsets(UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0))

        scrollIfActiveTextfieldIsHiddenByKeyboard(keyboardSize, currentResponder)
    }

    @objc
    internal func keyboardWillHide(_ notification: Notification) {
        setScrollInsets(.zero)
    }

    private func setScrollInsets(_ inset: UIEdgeInsets) {
        scrollView.contentInset = inset
        scrollView.scrollIndicatorInsets = inset
    }
}
