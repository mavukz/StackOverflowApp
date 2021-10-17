//
//  TypeAliases.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/17.
//

import Foundation

// MARK: - Networking Response Types
typealias SuccessDataResponseType = (_ successResponse: Data?) -> Void
typealias FailureResponseType = (_ error: Error?) -> Void
