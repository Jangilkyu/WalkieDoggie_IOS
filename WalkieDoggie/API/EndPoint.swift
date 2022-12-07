//
//  EndPoint.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/30.
//

import Foundation

let baseURL: String = "https://walkiedoggie-server.onrender.com/api/v1"

enum EndPoint {
  case register
  case login
  case centers
  case refresh
  case users

  var url: URL {
    switch self {
    case . register:
      return URL(string: "\(baseURL)/auth/register")!
    case .login:
      return URL(string: "\(baseURL)/auth/login")!
    case .centers:
      return URL(string: "\(baseURL)/centers")!
    case .refresh:
      return URL(string: "\(baseURL)/auth/refresh")!
    case .users:
      return URL(string: "\(baseURL)/users/me")!
    }
  }
}
