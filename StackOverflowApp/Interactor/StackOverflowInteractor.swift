//
//  StackOverflowInteractor.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/05.
//

import Foundation

class StackOverflowInteractor: StackOverflowBoundary {
    
    func searchForQuestions(with tag: String,
                            successBlock success: @escaping SuccessQuestionsResponseType,
                            failureBlock failure: @escaping FailureResponseType) {
        let webServicesManager = WebServicesManager.sharedInstance
        let url = "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged= \(tag)%203&site=stackoverflow&filter=withbody"
        webServicesManager.GET(urlString: url) { successResponse in
            // decode data to json then to codable
        } failureBlock: { error in
            failure(error)
        }
    }
}
