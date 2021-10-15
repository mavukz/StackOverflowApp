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
        let url = "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=\(tag)%203&site=stackoverflow&filter=withbody"
        webServicesManager.GET(urlString: url) { data in
            guard let safeData = data else {
                debugPrint("No data in interactor")
                let error = NSError.createCustomError(with: "No data in interactor")
                failure(error)
                return
            }
            let response: StackOverflowResponseModel? = self.decode(data: safeData)
            success(response)
        } failureBlock: { error in
            failure(error)
        }
    }
}
