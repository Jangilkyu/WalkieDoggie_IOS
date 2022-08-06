//
//  RoundedButton.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/07/03.
//

import UIKit
import Lottie

class RoundedButton: UIView {
    
    enum State {
        case initial
        case loading
        case failure(fallBack: String)
        case success(completion: LottieCompletionBlock)
    }
    
    var buttonState: State = .initial {
        didSet {
            switch self.buttonState {
                case .loading:
                let spinnerAnimation = Animation.named("button-spinner")
                playLottie(spinnerAnimation, toProgress: 0.8, loopMode: .loop)

            case .failure(let buttonTitle):
                let spinnerAnimation = Animation.named("button-failed")
                playLottie(
                    spinnerAnimation,
                    toProgress: 1,
                    loopMode: .playOnce
                )
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.lottieView.isHidden = true
                    self.button.setTitle(buttonTitle, for: .normal)
                }
            case .success(let completion):
                let spinnerAnimation = Animation.named("button-checkmark")
                playLottie(
                    spinnerAnimation,
                    toProgress: 1,
                    loopMode: .playOnce,
                    completion: completion
                )
                default:
                    return
            }
        }
    }
    
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = WDColor.darkGray.color
        btn.titleLabel?.font = WDFont.Black.of(size: 18)
        btn.frame.size = CGSize(width: 244, height: 47)
        btn.layer.cornerRadius = 30
        
        return btn
    }()
    
    let lottieView: AnimationView = AnimationView()
    
    required init(buttonTItle: String) {
        super.init(frame: .zero)
        button.setTitle(buttonTItle, for: .normal)
        configureLottie()
        addViews()
        setConstraints()
    }
    
    func playLottie(
        _ animation: Animation?,
        toProgress: AnimationProgressTime,
        loopMode: LottieLoopMode,
        completion: LottieCompletionBlock? = nil)
    {
        lottieView.isHidden = false
        lottieView.animation = animation
        lottieView.play(
            fromProgress: 0,
            toProgress: toProgress,
            loopMode: loopMode,
            completion: completion
        )
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configureLottie() {
      lottieView.isHidden = true
      lottieView.backgroundColor = .white
    }
    
    func addViews() {
        addSubview(button)
        addSubview(lottieView)
    }
    
    func setConstraints() {
        buttonConstraints()
        lottieViewConstraints()
    }
    
    func buttonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func lottieViewConstraints() {
      lottieView.translatesAutoresizingMaskIntoConstraints = false
      lottieView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
      lottieView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
      lottieView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
      lottieView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
