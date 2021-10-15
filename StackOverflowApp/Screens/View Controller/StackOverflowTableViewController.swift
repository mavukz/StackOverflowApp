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
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = UIColor.primaryBlueColor
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.backgroundColor = .white
        
        let centeredParagrahStyle = NSMutableParagraphStyle()
        centeredParagrahStyle.alignment = .center
        
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search",
                                                                                              attributes: [.paragraphStyle: centeredParagrahStyle])
        searchController.searchBar.isTranslucent = true
        searchController.searchBar.delegate = self
        return searchController
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
        guard let identifier = viewModel.identifier(for: indexPath) else { return UITableViewCell() }
        switch identifier {
        case .tagResultRow:
            <#code#>
        case .emptyRow:
            return createEmptyStateTableViewCell()
        }
        return UITableViewCell()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.visibleSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.visibleRows(for: section).count
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        // add loading indicator
        tableView.tableHeaderView = searchController.searchBar
        tableView.configureForDynamicHeightRows()
        tableView.sectionFooterHeight = 8
        tableView.register(UINib(nibName: "StackOverFlowEmptyTableViewCell", bundle: .main),
                           forCellReuseIdentifier: "StackOverFlowEmptyTableViewCell")
        tableView.register(UINib(nibName: "StackOverflowDetailTableViewCell", bundle: .main),
                           forCellReuseIdentifier: "StackOverflowDetailTableViewCell")
    }
    
    // MARK: - UITableViewCells Configuration
    private func createEmptyStateTableViewCell() -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StackOverFlowEmptyTableViewCell") as? StackOverFlowEmptyTableViewCell
//        cell?.configure(with: viewModel.)
        return cell ?? UITableViewCell()
    }
    
    private func createDetailTableViewCell() -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StackOverflowDetailTableViewCell") as? StackOverflowDetailTableViewCell
        return cell ?? UITableViewCell()
    }
}

// MARK: - StackOverflowSearchViewModelDelegate
extension StackOverflowTableViewController: StackOverflowSearchViewModelDelegate {
    
    func refreshViewContents() {
        view.removeLoadingView()
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
        view.showLoadingView()
        viewModel.performRemoteSearch(with: searchBar.searchTextField.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
