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
        searchController.hidesNavigationBarDuringPresentation = false
        
        let centeredParagrahStyle = NSMutableParagraphStyle()
        centeredParagrahStyle.alignment = .center
        
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search",
                                                                                              attributes: [.paragraphStyle: centeredParagrahStyle])
        searchController.searchBar.isTranslucent = false
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
    
    // MARK: - StatusBarStyle
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rowType = viewModel.identifier(for: indexPath) else { return UITableViewCell() }
        switch rowType {
        case .tagResultRow:
            return createDetailTableViewCell(at: indexPath)
        case .emptyRow:
            tableView.isScrollEnabled = false
            return createEmptyStateTableViewCell()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.visibleSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.visibleRows(for: section).count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let sectionType = viewModel.identifier(for: section) else { return .zero }
        switch sectionType {
        case .defaultSection:
            return section == 0 ? 16 : .zero
        case .emptySection:
            return .zero
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let rowType = viewModel.identifier(for: indexPath) else { return UITableView.automaticDimension }
        return rowType == .emptyRow ? tableView.frame.height : UITableView.automaticDimension
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let dataModel = viewModel.dataModel(at: indexPath) else { return }
        let detailScreen = UIStoryboard(name: "StackOverflowDetailScreen", bundle: .main)
        if let viewController = detailScreen.instantiateInitialViewController() as? StackOverflowDetailViewController {
            viewController.configure(with: dataModel)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.navigationItem.titleView = searchController.searchBar
        self.navigationController?.setStatusBar(backgroundColor: UIColor.primaryBlueColor)
        let statusBarHeight = navigationController?.statusBar()?.frame.height ?? .zero
        let searchBarHeight = searchController.searchBar.frame.height
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? .zero
        let padding: CGFloat = 10
        tableView.contentInset.top = statusBarHeight + searchBarHeight + padding - navigationBarHeight
        tableView.configureForDynamicHeightRows()
        tableView.sectionHeaderTopPadding = .zero
        tableView.sectionFooterHeight = 8
        tableView.sectionHeaderHeight = 0
        tableView.register(UINib(nibName: "StackOverFlowEmptyTableViewCell", bundle: .main),
                           forCellReuseIdentifier: "StackOverFlowEmptyTableViewCell")
        tableView.register(UINib(nibName: "StackOverflowDetailTableViewCell", bundle: .main),
                           forCellReuseIdentifier: "StackOverflowDetailTableViewCell")
    }
    
    // MARK: - UITableViewCells Configuration
    private func createEmptyStateTableViewCell() -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StackOverFlowEmptyTableViewCell") as? StackOverFlowEmptyTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(with: viewModel.emptyStateMessage)
        tableView.separatorStyle = .none
        return cell
    }
    
    private func createDetailTableViewCell(at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StackOverflowDetailTableViewCell") as? StackOverflowDetailTableViewCell,
              let cellViewModel = viewModel.cellViewModel(at: indexPath) else { return UITableViewCell() }
        cell.configure(with: cellViewModel)
        cell.accessoryType = .disclosureIndicator
        tableView.separatorStyle = .singleLine
        return cell
    }
    
    private func searchControllerExtraVerticalPadding() -> CGFloat {
        return searchController.searchBar.frame.height - (self.navigationController?.navigationBar.frame.height ?? 0)
    }

}

// MARK: - StackOverflowSearchViewModelDelegate
extension StackOverflowTableViewController: StackOverflowSearchViewModelDelegate {
    
    func refreshViewContents() {
        view.removeLoadingView()
        tableView.reloadData()
        tableView.isScrollEnabled = viewModel.hasData
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
