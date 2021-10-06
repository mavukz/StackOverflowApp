//
//  StackOverflowTableViewController.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/06.
//

import Foundation
import UIKit

class StackOverflowTableViewController: UITableViewController {
    
    // MARK: - Instance Variables
    private lazy var viewModel = StackOverflowSearchViewModel(with: self,
                                                              interactor: StackOverflowInteractor())
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        return searchBar
    }()
    
    // MARK: - Initializers
    init() {
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.visibleSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.visibleRows(for: section).count
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        // add loading indicator
        tableView.tableHeaderView = searchBar
        tableView.configureForDynamicHeightRows()
        tableView.sectionFooterHeight = 8
    }
}

// MARK: - StackOverflowSearchViewModelDelegate
extension StackOverflowTableViewController: StackOverflowSearchViewModelDelegate {
    
    func refreshViewContents() {
        // remove loading indicator
        tableView.reloadData()
    }
    
    func showErrorAlert(with title: String?, errorMessage: String?) {
        let alertController = UIAlertController(title: title,
                                                message: errorMessage,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok",
                                                style: .default,
                                                handler: { _ in
            self.dismiss(animated: true)
        }))
        self.present(alertController, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension StackOverflowTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.performRemoteSearch(with: searchBar.searchTextField.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
