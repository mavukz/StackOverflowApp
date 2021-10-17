//
//  StackOverflowDetailViewModel.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/17.
//

import Foundation
import UIKit

class StackOverflowDetailViewModel {
    
    private let dataModel: StackOverflowDataModalable
    private let interactor: StackOverflowBoundary
    
    init(dataModel: StackOverflowDataModalable,
         interactor: StackOverflowBoundary) {
        self.dataModel = dataModel
        self.interactor = interactor
    }
    
    // MARK: - Computed Variables
    var headerText: String? {
        return dataModel.title
    }
    
    var bodyText: String? {
        return dataModel.body
    }
    
    var tagsText: String? {
        guard let tags = dataModel.tags else { return nil }
        var tagsdescription = ""
        for tag in tags {
            if tagsdescription.isEmpty {
                tagsdescription += tag
                continue
            }
            if tagsdescription.count == tags.count {
                tagsdescription += tag
                break
            }
            tagsdescription += ", " + tag
        }
        return tagsdescription
    }
    
    // MARK: - Mutators
    func retrieveProfilePicture(completion: @escaping SuccessDataResponseType) {
        guard let imageURL = dataModel.owner?.profileImage else {
            completion(nil)
            return
        }
        interactor.searchForProfileImage(with: imageURL) { data in
            completion(data)
        } failureBlock: { error in
            completion(nil)
        }
    }
    
}
