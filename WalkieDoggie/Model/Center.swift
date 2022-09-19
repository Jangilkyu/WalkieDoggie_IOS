//
//  Center.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/16.
//

import Foundation

struct Center: Codable {
    let name: String
    let subtitle: String
    let address: String
    let distance: String
    let intro: String
    
    enum CodingKeys: String, CodingKey {
        case name, subtitle, address, distance, intro
    }
}
