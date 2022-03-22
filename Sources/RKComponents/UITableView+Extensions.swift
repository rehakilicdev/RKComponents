//
//  UITableView+Extensions.swift
//  RKFoundation
//
//  Created by Reha Kilic on 7.01.2019.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public extension UITableView {
    /**
     Returns a cell previously registered in the tableView and mapped to its concrete type.
     */
    func dequeueReusableCell<T: UITableViewCell>(withClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            preconditionFailure("Cell must be registered")
        }
        return cell
    }

    /**
     Returns a view previously registered in the tableView and mapped to its concrete type.
     */
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass: T.Type) -> T {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            preconditionFailure("Cell must be registered")
        }
        return view
    }
}
