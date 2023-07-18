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
  @Binding var animationProgress: AnimationProgressTime
  @Binding var isPlaying: Bool
  
  let name: String
  let animationSpeed: CGFloat
  let loopMode: LottieLoopMode
  let completion: ((Bool) -> Void)?
  
  init(
    name: String,
    animationProgress: Binding<AnimationProgressTime> = .constant(0),
    isPlaying: Binding<Bool> = .constant(true),
    animationSpeed: CGFloat = 1.0,
    loopMode: LottieLoopMode = .loop,
    completion: ((Bool) -> Void)? = nil
  ) {
    self.name = name
    _animationProgress = animationProgress
    _isPlaying = isPlaying
    self.animationSpeed = animationSpeed
    self.loopMode = loopMode
    self.completion = completion
  }
}

extension InternalLottieView: UIViewRepresentable {
  class Coordinator: NSObject {
    @Binding var animationProgress: AnimationProgressTime
    @Binding var isPlaying: Bool
    var completion: ((Bool) -> Void)?
    
    init(animationProgress: Binding<AnimationProgressTime>, isPlaying: Binding<Bool>, completion: ((Bool) -> Void)?) {
      _animationProgress = animationProgress
      _isPlaying = isPlaying
      self.completion = completion
    }
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(animationProgress: $animationProgress, isPlaying: $isPlaying, completion: completion)
  }
  
  func makeUIView(context: UIViewRepresentableContext<InternalLottieView>) -> LottieAnimationContainerView {
    LottieAnimationContainerView(name: name)
  }
  
  func updateUIView(_ uiView: LottieAnimationContainerView, context: UIViewRepresentableContext<InternalLottieView>) {
    uiView.animationView.animationSpeed = animationSpeed
    uiView.animationView.loopMode = loopMode
    uiView.animationView.currentProgress = animationProgress

    if isPlaying {
      uiView.animationView.play { finished in
        context.coordinator.completion?(finished)
        DispatchQueue.main.async {
          self.isPlaying = false
        }
      }
    } else {
      uiView.animationView.pause()
    }
  }
}
