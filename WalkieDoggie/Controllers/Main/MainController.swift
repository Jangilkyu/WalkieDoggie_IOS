//
//  MainController.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/08/06.
//

import UIKit

let mainCellId = "mainCellId"
class MainController: UIViewController {
  
  var centers: Centers!
  var resHandler: ResHandler!
  var api: RestProcessor!
  
  let titleLabel: UILabel = {
    let lb = UILabel()
    lb.text = "가까운 유기견 센터 목록"
    lb.font = WDFont.Medium.of(size: 23)
    return lb
  }()
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(
      frame: .zero,
      collectionViewLayout: layout)
    cv.showsVerticalScrollIndicator = false
    return cv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.setHidesBackButton(true, animated: false)
    setup()
    configureCollectionView()
  }
  
  override func loadView() {
    super.loadView()
    api = RestProcessor()
    api.requestDelegate = self
    getCenters()
  }
  
  func getCenters() {
    api.reqeustHttpHeaders.add(
      value: "application/json",
      forKey: "Content-Type"
    )
    api.reqeustHttpHeaders.add(
      value: "Bearer \(LS.getAccessToken()!)",
      forKey: "authorization")
    api.makeRequest(
      toURL: EndPoint.centers.url,
      withHttpMethod: .get,
      usage: .centers)
  }
  
  private func configureCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(
      MainCell.self,
      forCellWithReuseIdentifier: mainCellId)
  }
  
  private func setup() {
    view.backgroundColor = .white
    addViews()
    setConstraints()
  }
  
  private func addViews() {
    view.addSubview(titleLabel)
    view.addSubview(collectionView)
  }
  
  private func setConstraints() {
    titleLabelConstraints()
    collectionViewConstraints()
  }
  
  private func titleLabelConstraints() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
  }
  
  private func collectionViewConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
  }
}

extension MainController:
  UICollectionViewDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    let view = CenterDetailsController()
    navigationController?.pushViewController(view, animated: true)
  }
}

extension MainController:
  UICollectionViewDataSource {
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
      withReuseIdentifier: mainCellId,
      for: indexPath) as? MainCell else { return UICollectionViewCell() }
    
    return cell
  }
}

extension MainController:
  UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: collectionView.frame.width, height: 160)
    }
}

extension MainController:
  RestProcessorRequestDelegate {
  func didFailToPrepareReqeust(
    _ result: RestProcessor.Results,
    _ usage: EndPoint
  ) {
  }
  
  func didReceiveResponseFromDataTask(
    _ result: RestProcessor.Results,
    _ usage: EndPoint
  ) {
  }
}
