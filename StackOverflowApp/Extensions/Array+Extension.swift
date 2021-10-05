//
//  Array+Extension.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/05.
//

import Foundation

extension Array {
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
