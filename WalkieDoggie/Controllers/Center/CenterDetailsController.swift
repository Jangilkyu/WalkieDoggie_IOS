//
//  CenterDetailsController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/19.
//

import UIKit

class CenterDetailsController: UIViewController {
  
  var headerView: CenterDtHeaderView!
  
  fileprivate let centerDtheaderId = "centerDtheaderId"
  fileprivate let descriptionCellId = "descriptionCellId"
  fileprivate let buttonCellId = "buttonCellId"
  fileprivate let animalInfoCellId = "animalInfoCellId"
  
  let collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: CenterDtStretchyLayout())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setup()
  }
  
  private func setup() {
    configureCollectionView()
    addViews()
    setConstraints()
  }
  
  private func configureCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    
    collectionView.register(
      CenterDtHeaderView.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: centerDtheaderId)
    
    // Center Info Cell
    collectionView.register(
      CenterDtDescriptionCell.self,
      forCellWithReuseIdentifier: descriptionCellId)
    
    // Button
    collectionView.register(
      CenterDtBtuttonCell.self,
      forCellWithReuseIdentifier: buttonCellId)
    
    // body
    collectionView.register(
      CenterAnimalInfoCell.self,
      forCellWithReuseIdentifier: animalInfoCellId)
  }
  
  private func addViews() {
    view.addSubview(collectionView)
  }
  
  private func setConstraints() {
    collectionViewConstraints()
  }
  
  private func collectionViewConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  
}

extension CenterDetailsController: UICollectionViewDelegate {
  
}

extension CenterDetailsController: UICollectionViewDataSource {
  
  // Header
  func collectionView(
    _ collectionView: UICollectionView,
    viewForSupplementaryElementOfKind kind: String,
    at indexPath: IndexPath
  ) -> UICollectionReusableView {
    guard let view = collectionView.dequeueReusableSupplementaryView(
      ofKind: kind,
      withReuseIdentifier: centerDtheaderId,
      for: indexPath
    ) as? CenterDtHeaderView else { return UICollectionReusableView() }
    headerView = view
    return headerView
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return 6
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    var cell: UICollectionViewCell!
    switch indexPath.item {
      
    // DescriptionCell
    case 0:
      cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: descriptionCellId,
        for: indexPath)
    // Button Cell
    case 1:
      guard let buttonCell = collectionView.dequeueReusableCell(
        withReuseIdentifier: buttonCellId,
        for: indexPath) as? CenterDtBtuttonCell else { return UICollectionViewCell() }
      buttonCell.delegate = self
      cell = buttonCell
      
    // animalInfoCell
    default:
      cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: animalInfoCellId,
        for: indexPath)
    }
    return cell
  }
}

extension CenterDetailsController: UICollectionViewDelegateFlowLayout {
  // Header
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    referenceSizeForHeaderInSection section: Int
  ) -> CGSize {
    return CGSize(width: view.frame.width, height: 200)
  }
  
  // body
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(width: view.frame.width - 30 , height: 150)
  }
}

extension CenterDetailsController: CenterDtButtonCellDelegate {
  func didSelectButton(_ button: UIButton) {
    if button.titleLabel?.text == "봉사활동 신청하기" {
      print("봉사활동 신청하기 버튼 눌림")
    }
  }
}
