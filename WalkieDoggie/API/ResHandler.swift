//
//  ResHandler.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/08/10.
//

import Foundation

class ResHandler {
    enum resultTypes {
        case created
        case ok(RestProcessor.RestEntity)
        case clientError
        case serverError
        case duplicateEmail
    }
    
    private let result: RestProcessor.Results
    
    init(result: RestProcessor.Results) {
        self.result = result
    }
    
    func getResult() -> resultTypes? {
        guard let statusCode = result.response?.httpStatusCode else { return nil }

        if statusCode == 201 {
            return .created
        } else if statusCode == 200 {
            guard let headers = result.response?.headers else { return nil}
            return .ok(headers)
        } else if statusCode > 399, statusCode < 500 {
            return .clientError
        } else {
            guard let data = result.data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]),
                  let unwrappedJson = json as? [String : Any],
                  let errorMsg = unwrappedJson["msg"] as? String else { return .serverError }
            if errorMsg.contains("E11000 duplicate key error collection") {
                return .duplicateEmail
            }
        }
        
        return nil
    }
    
}
