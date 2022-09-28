//
//  CenterDetailsController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/09/19.
//

import UIKit

class CenterDetailsController: UIViewController {
  
  fileprivate let animalInfoCellId = "animalInfoCellId"
  
  let collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout())
  
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
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return 5
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: animalInfoCellId,
      for: indexPath) as? CenterAnimalInfoCell else { return UICollectionViewCell()
    }
    return cell
  }
}

extension CenterDetailsController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(width: view.frame.width - 30 , height: 150)
  }
}
