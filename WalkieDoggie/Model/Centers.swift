//
//  Centers.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/16.
//

import Foundation

class Centers {
    
    let centers: [Center]
    
    init(_ centers: [Center]) {
        self.centers = centers
    }
    
    func getNumberOfCenters() -> Int {
        return centers.count
    }
    
    func getOneCenter(at indexPath: IndexPath) -> Center {
        return centers[indexPath.row]
    }
}
