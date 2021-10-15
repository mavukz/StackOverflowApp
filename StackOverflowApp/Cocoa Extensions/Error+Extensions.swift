//
//  Error+Extensions.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/05.
//

import Foundation

extension Error {
    static func createCustomError(with errorMessage: String) -> Error {
        return NSError(domain: "",
                       code: 500,
                       userInfo: [NSLocalizedDescriptionKey: errorMessage])
    }
}
