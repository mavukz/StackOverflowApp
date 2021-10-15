//
//  Interactor+Extensions.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/15.
//

import Foundation

extension StackOverflowInteractor {
    
    func decode<T: Codable>(data: Data) -> T? {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            debugPrint("Error in decoding model: \(String(describing: T.self)) Error message: \(error.localizedDescription)")
            return nil
        }
    }
}
