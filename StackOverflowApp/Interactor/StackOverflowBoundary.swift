//
//  StackOverflowBoundary.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/05.
//

import Foundation

typealias SuccessQuestionsResponseType = ([StackOverflowDataModalable]?) -> Void

protocol StackOverflowBoundary {
    
    func searchForQuestions(with tag: String,
                            successBlock success: @escaping SuccessQuestionsResponseType,
                            failureBlock failure: @escaping FailureResponseType)
}
