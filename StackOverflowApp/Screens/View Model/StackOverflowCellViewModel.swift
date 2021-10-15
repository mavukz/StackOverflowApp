//
//  StackOverflowCellViewModel.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/15.
//

import Foundation
import UIKit

class StackOverflowCellViewModel {

    // Text colors are static don't really have to cater for them here
    let questionTitle: String?
    let votesText: String?
    let answersText: String?
    let viewsText: String?
    let askedByText: String?

    init(questionTitle: String?,
         votesText: String?,
         answersText: String?,
         viewsText: String?,
         askedByText: String?) {
        self.questionTitle = questionTitle
        self.votesText = votesText
        self.answersText = answersText
        self.viewsText = viewsText
        self.askedByText = askedByText
    }
    
    var votesDescription: String? {
        guard let safeVotesText = votesText else { return nil }
        return stringValueNotOne(votesText) ? "\(safeVotesText) Votes" : "\(safeVotesText) Vote"
    }
    
    var answersDescription: String? {
        guard let safeAnswersText = answersText else { return nil }
        return stringValueNotOne(answersText) ? "\(safeAnswersText) answers" : "\(safeAnswersText) answer"
    }
    
    var viewsDescription: String? {
        guard let safeViewsText = viewsText else { return nil }
        return stringValueNotOne(viewsText) ? "\(safeViewsText) answers" : "\(safeViewsText) answer"
    }
    
    var askedByDescription: String? {
        guard let safeAskedByText = askedByText else { return nil }
        return "aksed by \(safeAskedByText)"
    }
    
    // MARK: - Private
    private func stringValueNotOne(_ value: String?) -> Bool {
        guard let safeString = value,
        let intValue = Int(safeString) else { return false }
        return intValue != 1
    }
}
