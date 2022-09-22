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
        case accessTokenExpired
        case unauthorized
    }
    
    private let result: RestProcessor.Results
    
    init(result: RestProcessor.Results) {
        self.result = result
    }
    
    func getResult(_ result: RestProcessor.Results? = nil) -> resultTypes? {
        var res: RestProcessor.Results!
        
        if let result = result {
          res = result
        } else {
          res = self.result
        }
      guard let statusCode = res.response?.httpStatusCode else { return nil }

        if statusCode == 201 {
            return .created
        } else if statusCode == 200 {
            guard let headers = res.response?.headers else { return nil}
            return .ok(headers)
        } else if statusCode == 401 { // unauthorized
          guard let msg = getMsgFromBody(data: res.data) else { return .serverError }
          return msg.contains("access token expired") ? .accessTokenExpired : .unauthorized
        } else if statusCode > 399, statusCode < 500 {
          return .clientError
        } else {
          guard let msg = getMsgFromBody(data: res.data) else { return .serverError }
            if msg.contains("E11000 duplicate key error collection") {
                return .duplicateEmail
            }
        }
        
        return nil
    }
  
  private func getMsgFromBody(data: Data?) -> String? {
    guard let data = data,
          let json = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]),
          let unwrappedJson = json as? [String: Any],
          let msg = unwrappedJson["msg"] as? String else { return nil }
    return msg
  }
    
}
