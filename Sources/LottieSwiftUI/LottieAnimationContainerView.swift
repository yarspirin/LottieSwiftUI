//
//  LottieAnimationContainerView.swift
//  
//
//  Created by Yaroslav Spirin on 18.07.2023.
//

import UIKit
import Lottie

final class LottieAnimationContainerView: UIView {
  
  let animationView: LottieAnimationView
  
  init(name: String) {
    animationView = LottieAnimationView()
    animationView.animation = .named(name)
    super.init(frame: .zero)
    
    addSubview(animationView)
    enforceLayout()
  }
  
  private func enforceLayout() {
    animationView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: animationView.topAnchor),
      bottomAnchor.constraint(equalTo: animationView.bottomAnchor),
      leadingAnchor.constraint(equalTo: animationView.leadingAnchor),
      trailingAnchor.constraint(equalTo: animationView.trailingAnchor),
    ])
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
