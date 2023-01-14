//
//  User.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2023/01/08.
//

import Foundation

struct User: Codable {
  let email: String
  let name: String?
  let phoneNumber: String?
  
  enum CodingKeys: String, CodingKey {
    case email,
         name,
         phoneNumber
  }
}
