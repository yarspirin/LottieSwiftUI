//
//  InternalLottieView.swift
//
//
//  Created by Yaroslav Spirin on 18.07.2023.
//

import SwiftUI
import Lottie

/// Lottie animation view available in SwiftUI.
struct InternalLottieView {
  let name: String
  let animationSpeed: CGFloat
  let loopMode: LottieLoopMode
  
  init(
    name: String,
    animationSpeed: CGFloat = 1.0,
    loopMode: LottieLoopMode = .loop
  ) {
    self.name = name
    self.animationSpeed = animationSpeed
    self.loopMode = loopMode
  }
}

extension InternalLottieView: UIViewRepresentable {
  func makeUIView(context: UIViewRepresentableContext<InternalLottieView>) -> LottieAnimationContainerView {
    let container = LottieAnimationContainerView(name: name)
    container.animationView.loopMode = loopMode
    container.animationView.animationSpeed = animationSpeed
    container.animationView.play()
    return container
  }
  
  func updateUIView(_ uiView: LottieAnimationContainerView, context: UIViewRepresentableContext<InternalLottieView>) {
  }
}
