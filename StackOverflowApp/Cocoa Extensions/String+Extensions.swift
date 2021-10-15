//
//  String+Extensions.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/06.
//

import Foundation
extension String {
    
    static func isNilOrWhitespace(_ text: String?) -> Bool {
        guard let noNilText = text else { return true }
        return noNilText.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
