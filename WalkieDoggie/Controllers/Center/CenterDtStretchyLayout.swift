//
//  CenterDtStretchyLayout.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/10/08.
//

import UIKit

class CenterDtStretchyLayout: UICollectionViewFlowLayout {
  override func layoutAttributesForElements(
    in rect: CGRect
  ) -> [UICollectionViewLayoutAttributes]? {
    let layoutAttributes = super.layoutAttributesForElements(in: rect)
    layoutAttributes?.forEach({ attribute in
      if attribute.representedElementKind == UICollectionView.elementKindSectionHeader &&
          attribute.indexPath.section == 0 {
        
        guard let collectionView = collectionView else { return }
        
        let contentOffsetY = collectionView.contentOffset.y
        if contentOffsetY > 0 {
          return
        }
        
        let width = collectionView.frame.width
        let heihgt = attribute.frame.height - contentOffsetY
        
        attribute.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: heihgt)
      }
    })
    return layoutAttributes
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
}
