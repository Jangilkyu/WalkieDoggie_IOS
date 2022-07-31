//
//  EndPoint.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/30.
//

import Foundation

let baseURL: String = "https://wkdg.herokuapp.com/api/v1"

enum EndPoint: CustomStringConvertible {
    case register
    
    var description: String {
        switch self {
        case .register:
            return baseURL + "/auth/register"
        }
    }
    var url: URL {
        switch self {
            case . register:
            return URL(string: "\(baseURL)/auth/register")!
        }
    }
}
