//
//  LottieView.swift
//
//
//  Created by Yaroslav Spirin on 18.07.2023.
//

import SwiftUI
import Lottie

/// Lottie animation view accessible from SwiftUI.
public struct LottieView: View {
  /// The filename of the Lottie JSON animation file.
  let name: String
  
  /// The speed at which the animation should be played.
  let animationSpeed: CGFloat
  
  /// The loop mode of the animation.
  let loopMode: LottieLoopMode
  
  /// Initializes a new `LottieView` instance with customizable options.
  ///
  /// - Parameters:
  ///   - name: The name of the Lottie animation file (without the file extension). This file should be added to your project's assets.
  ///   - loopMode: The loop mode for the animation. Default is `LottieLoopMode.playOnce`.
  ///               Other options include `.loop` and `.autoReverse`.
  ///   - animationSpeed: The speed of the animation. It should be a `Double` value, where `1.0` represents
  ///                     the normal speed. Defaults to `1.0`.
  public init(
    name: String,
    animationSpeed: CGFloat = 1.0,
    loopMode: LottieLoopMode = .loop
  ) {
    self.name = name
    self.animationSpeed = animationSpeed
    self.loopMode = loopMode
  }
  
  public var body: some View {
    InternalLottieView(
      name: name,
      animationSpeed: animationSpeed,
      loopMode: loopMode
    )
  }
}
