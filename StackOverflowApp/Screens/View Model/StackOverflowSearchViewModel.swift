//
//  StackOverflowSearchViewModel.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/05.
//

import Foundation

protocol StackOverflowSearchViewModelDelegate: NSObjectProtocol {
    func refreshViewContents()
    func showErrorAlert(with title: String?,
                        errorMessage: String?)
}

class StackOverflowSearchViewModel {
    
    // MARK: - Instance Fields
    private var responseModel: StackOverflowResponseModel?
    private weak var delegate: StackOverflowSearchViewModelDelegate?
    private let interactor: StackOverflowBoundary
    private var cellViewModels: [StackOverflowCellViewModel]?
    
    // MARK: - Initializers
    init(with delegate: StackOverflowSearchViewModelDelegate,
         interactor: StackOverflowBoundary) {
        self.delegate = delegate
        self.interactor = interactor
    }
    
    // MARK: - Computed Variables
    var visibleSections: [SectionType] {
        return createVisibleSections()
    }
    
    var emptyStateMessage: String? {
        return "Stack Overflow Search"
    }
    
    // MARK: - Mutators
    func performRemoteSearch(with tagText: String?) {
        guard let text = tagText,
        !String.isNilOrWhitespace(text) else {
            debugPrint("Cannot search for nil white space text")
            return
        }
        interactor.searchForQuestions(with: text) { [weak self] response in
            self?.responseModel = response
            self?.createCellViewModel(from: response)
            self?.delegate?.refreshViewContents()
        } failureBlock: { [weak self] error in
            self?.delegate?.showErrorAlert(with: "Error",
                                           errorMessage: error?.localizedDescription)
        }
    }
    
    // MARK: - Getters
    func identifier(for section: Int) -> SectionType? {
        return visibleSections[safe: section]
    }
    
    func identifier(for indexPath: IndexPath) -> RowType? {
        return visibleRows(for: indexPath.section)[safe: indexPath.row]
    }
    
    func cellViewModel(at indexPath: IndexPath) -> StackOverflowCellViewModel? {
        guard let rowType = identifier(for: indexPath) else { return nil }
        switch rowType {
        case .tagResultRow:
            return cellViewModels?[safe: indexPath.section]
        default: return nil
        }
    }
    
    func visibleRows(for section: Int) -> [RowType] {
        var rows: [RowType] = []
        guard let sectionType = identifier(for: section) else { return rows }
        switch sectionType {
        case .defaultSection:
            rows.append(contentsOf: rowsForDefaultSection())
        case .emptySection:
            rows.append(.emptyRow)
        }
        return rows
    }
    
    // MARK: - Visible Sections
    private func createVisibleSections() -> [SectionType] {
        var sections: [SectionType] = []
        guard let results = cellViewModels,
              !results.isEmpty else { return [.emptySection] }
        for _ in results {
            sections.append(.defaultSection)
        }
        return sections
    }
    
    // MARK: - Visible Rows
    private func rowsForDefaultSection() -> [RowType] {
        var rows: [RowType] = []
        rows.append(.tagResultRow)
        return rows
    }
    
    // MARK: - Cell ViewModels
    private func createCellViewModel(from response: StackOverflowResponseModel?) {
        guard let items = response?.items else {
            debugPrint("No items to map in view model")
            return
        }
        cellViewModels = []
        for item in items {
            let viewModel = StackOverflowCellViewModel(questionTitle: item.title,
                                                       votesText: String.optionalIntToString(item.score),
                                                       answersText: String.optionalIntToString(item.answerCount),
                                                       viewsText: String.optionalIntToString(item.viewCount),
                                                       askedByText: item.owner?.displayName)
            cellViewModels?.append(viewModel)
        }
    }
}

extension StackOverflowSearchViewModel {
    enum SectionType {
        case defaultSection
        case emptySection
    }
    
    enum RowType {
        case tagResultRow
        case emptyRow
    }
}
