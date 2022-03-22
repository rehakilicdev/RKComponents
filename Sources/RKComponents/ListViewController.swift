//
//  ListViewController.swift
//  RKFoundation
//
//  Created by Reha Kılıç on 19.05.2020.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public class ListViewController: UIViewController {
    private(set) public lazy var tableView = makeTableView()
    private let dataSource: ListViewDataSource
    private weak var delegate: UITableViewDelegate?
    private let style: UITableView.Style

    public init(dataSource: ListViewDataSource, delegate: UITableViewDelegate? = nil, style: UITableView.Style = .plain) {
        self.dataSource = dataSource
        self.delegate = delegate
        self.style = style
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public override func loadView() {
        super.loadView()
        view = tableView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
}

private extension ListViewController {
    func configureTableView() {
        dataSource.registerCells(to: tableView)
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
    }

    func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: style)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = .zero
        tableView.tableFooterView = UIView() // Clean up the separators for empty cells
        return tableView
    }
}

public protocol ListViewDataSource: UITableViewDataSource {
    func registerCells(to tableView: UITableView)
}

