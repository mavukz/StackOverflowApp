//
//  WebServicesManager.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/04.
//

import Foundation

typealias SuccessDataResponseType = (_ successResponse: Data?) -> Void
typealias FailureResponseType = (_ error: Error?) -> Void

class WebServicesManager {
    
    static let sharedInstance = WebServicesManager()
    
    func GET(urlString: String,
             successBlock success: @escaping SuccessDataResponseType,
             failureBlock failure: @escaping FailureResponseType) {
        guard let url = URL(string: urlString) else {
            debugPrint("Invalid URL")
            return
        }
                let urlRequest = URLRequest(url: url)
                let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { data, urlResponse, error in
            DispatchQueue.main.async {
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    debugPrint("No response from the server")
                    return
                }
                if httpResponse.statusCode == 200 {
                    success(data)
                } else {
                    failure(error)
                }
            }
        }
        task.resume()
    }
}


