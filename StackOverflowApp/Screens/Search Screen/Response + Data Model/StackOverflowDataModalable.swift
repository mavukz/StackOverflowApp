//
//  StackOverflowDataModalable.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/17.
//

import Foundation

protocol StackOverflowDataModalable {
    var tags: [String]? { get }
    var owner: Owner? { get }
    var isAnswered: Bool? { get }
    var viewCount: Int? { get }
    var answerCount: Int? { get }
    var score: Int? { get }
    var lastActivityDate: Int? { get }
    var creationDate: Int? { get }
    var questionID: Int? { get }
    var contentLicense: ContentLicense? { get }
    var link: String? { get }
    var title: String? { get }
    var body: String? { get }
    var acceptedAnswerID: Int? { get }
    var lastEditDate: Int? { get }
    var closedDate: Int? { get }
    var closedReason: String? { get }
}
