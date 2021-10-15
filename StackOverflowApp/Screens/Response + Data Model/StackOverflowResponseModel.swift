//
//  StackOverflowResponseModel.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/05.
//

import Foundation

struct StackOverflowResponseModel: Codable {
    let items: [Item]?
    let hasMore: Bool?
    let quotaMax, quotaRemaining: Int?

    enum CodingKeys: String, CodingKey {
        case items
        case hasMore = "has_more"
        case quotaMax = "quota_max"
        case quotaRemaining = "quota_remaining"
    }
}

// MARK: - Item
struct Item: Codable {
    let tags: [String]?
    let owner: Owner?
    let isAnswered: Bool?
    let viewCount, answerCount, score, lastActivityDate: Int?
    let creationDate, questionID: Int?
    let contentLicense: ContentLicense?
    let link: String?
    let title, body: String?
    let acceptedAnswerID, lastEditDate, closedDate: Int?
    let closedReason: String?

    enum CodingKeys: String, CodingKey {
        case tags, owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case answerCount = "answer_count"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case questionID = "question_id"
        case contentLicense = "content_license"
        case link, title, body
        case acceptedAnswerID = "accepted_answer_id"
        case lastEditDate = "last_edit_date"
        case closedDate = "closed_date"
        case closedReason = "closed_reason"
    }
}

enum ContentLicense: String, Codable {
    case ccBySa30 = "CC BY-SA 3.0"
    case ccBySa40 = "CC BY-SA 4.0"
}

// MARK: - Owner
struct Owner: Codable {
    let reputation, userID: Int?
    let userType: UserType?
    let profileImage: String?
    let displayName: String?
    let link: String?
    let acceptRate: Int?

    enum CodingKeys: String, CodingKey {
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
        case acceptRate = "accept_rate"
    }
}

enum UserType: String, Codable {
    case doesNotExist = "does_not_exist"
    case registered = "registered"
}
