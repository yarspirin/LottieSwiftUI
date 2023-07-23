//
//  InternalLottieView.swift
//
//
//  Created by Yaroslav Spirin on 18.07.2023.
//

import SwiftUI
import Lottie

struct InternalLottieView {
  let name: String
  let animationSpeed: CGFloat
  let loopMode: LottieLoopMode
  @Binding var playbackState: LottieView.PlaybackState
  
  init(
    name: String,
    animationSpeed: CGFloat = 1.0,
    loopMode: LottieLoopMode = .loop,
    playbackState: Binding<LottieView.PlaybackState>
  ) {
    self.name = name
    self.animationSpeed = animationSpeed
    self.loopMode = loopMode
    self._playbackState = playbackState
  }
}

extension InternalLottieView: UIViewRepresentable {
  func makeUIView(context: UIViewRepresentableContext<InternalLottieView>) -> LottieAnimationContainerView {
    let container = LottieAnimationContainerView(name: name)
    container.animationView.loopMode = loopMode
    container.animationView.animationSpeed = animationSpeed
    updatePlaybackState(for: container.animationView)
    return container
  }
  
  func updateUIView(_ uiView: LottieAnimationContainerView, context: UIViewRepresentableContext<InternalLottieView>) {
    updatePlaybackState(for: uiView.animationView)
  }
  
  private func updatePlaybackState(for animationView: LottieAnimationView) {
    switch playbackState {
    case .playing:
      animationView.play()
    case .paused:
      animationView.pause()
    case .stopped:
      animationView.stop()
    }
  }
}
