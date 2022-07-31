//
//  RestProcessor+Model.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/30.
//

import Foundation

extension RestProcessor {
    
    // MARK: - httpMethod
    enum HttpMethod: String {
        case get
        case post
        case put
        case patch
        case delete
    }
    
    // MARK: - Request
    struct RestEntity {
        private var values: [String : String] = [:]
        
        mutating func add(value: String, forKey key: String) {
            values[key] = value
        }
        
        func value(forKey key: String) -> String? {
            return values[key]
        }
        
        func allValues() -> [String: String] {
            return values
        }
        
        func totalItems() -> Int {
            return values.count
        }
    }
    
    // MARK: - Response
    struct Response {
        var response: URLResponse?
        var httpStatusCode: Int = 0
        var headers = RestEntity()
        
        init(fromURLResponse response: URLResponse?) {
            guard let response = response else { return }
            self.response = response
            
            httpStatusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            if let headerFields = (response as? HTTPURLResponse)?.allHeaderFields {
                for (key, value) in headerFields {
                    headers.add(value: "\(value)", forKey: "\(key)")
                }
            }
        }
    }
    
    // MARK: - Result
    struct Results {
        var data: Data?
        var response: Response?
        var error: Error?
        
        init(
            withData data: Data?,
            response: Response?,
            error: Error?
        ) {
            self.data = data
            self.response = response
            self.error = error
        }
        
        init(withError error: Error) {
            self.error = error
        }
    }
    
    // MARK: - Error case
    enum CustomError: Error {
        case failedToCreateRequest
    }

}

// MARK: CustomError를 위한 extension
extension RestProcessor.CustomError: LocalizedError {
    public var localizedDescription: String {
        switch self {
        case .failedToCreateRequest:
            return NSLocalizedString("URLReqeust를 만드는데 실패 했습니다.", comment: "")
        }
    }
}
