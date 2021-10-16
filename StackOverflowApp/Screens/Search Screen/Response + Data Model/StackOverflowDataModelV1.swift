//
//  StackOverflowDataModelV1.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/17.
//

import Foundation

struct StackOverflowDataModelV1: StackOverflowDataModalable {
    var tags: [String]?
    var owner: Owner?
    var isAnswered: Bool?
    var viewCount: Int?
    var answerCount: Int?
    var score: Int?
    var lastActivityDate: Int?
    var creationDate: Int?
    var questionID: Int?
    var contentLicense: ContentLicense?
    var link: String?
    var title: String?
    var body: String?
    var acceptedAnswerID: Int?
    var lastEditDate: Int?
    var closedDate: Int?
    var closedReason: String?
    
    init(with responseModelItem: Item) {
        self.tags = responseModelItem.tags
        self.owner = responseModelItem.owner
        self.isAnswered = responseModelItem.isAnswered
        self.viewCount = responseModelItem.viewCount
        self.answerCount = responseModelItem.answerCount
        self.score = responseModelItem.score
        self.lastActivityDate = responseModelItem.lastActivityDate
        self.creationDate = responseModelItem.creationDate
        self.questionID = responseModelItem.questionID
        self.contentLicense = responseModelItem.contentLicense
        self.link = responseModelItem.link
        self.title = responseModelItem.title
        self.body = responseModelItem.body
        self.acceptedAnswerID = responseModelItem.acceptedAnswerID
        self.lastEditDate = responseModelItem.lastEditDate
        self.closedDate = responseModelItem.closedDate
        self.closedReason = responseModelItem.closedReason
    }
}
