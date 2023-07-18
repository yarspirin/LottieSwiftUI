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
  /// The current progress of the animation.
  @Binding var animationProgress: AnimationProgressTime
  
  /// Whether the animation is currently playing.
  @Binding var isPlaying: Bool
  
  /// The filename of the Lottie JSON animation file.
  let name: String
  
  /// The speed at which the animation should be played.
  let animationSpeed: CGFloat
  
  /// The loop mode of the animation.
  let loopMode: LottieLoopMode
  
  /// The completion handler to be called when the animation ends.
  let completion: ((Bool) -> Void)?
  
  /// Initializes a new `LottieView` instance with customizable options.
  ///
  /// - Parameters:
  ///   - name: The name of the Lottie animation file (without the file extension). This file should be added to your project's assets.
  ///   - loopMode: The loop mode for the animation. Default is `LottieLoopMode.playOnce`.
  ///               Other options include `.loop` and `.autoReverse`.
  ///   - animationProgress: A binding to the initial progress of the animation. It should be a `Double`
  ///                        value between `0.0` and `1.0`, where `0.0` represents the start of the animation
  ///                        and `1.0` represents the end. Changes to this binding will update the animation's progress.
  ///                        Defaults to `0.0`.
  ///   - isPlaying: A binding to a `Bool` that represents whether the animation is currently playing. Changes
  ///                to this binding will start or stop the animation. Defaults to `true`.
  ///   - animationSpeed: The speed of the animation. It should be a `Double` value, where `1.0` represents
  ///                     the normal speed. Defaults to `1.0`.
  ///   - completion: A closure that gets called when the animation completes. It gets passed a `Bool` that
  ///                 indicates whether the animation completed fully. `true` means the animation ran to its end,
  ///                 `false` means the animation was stopped. Defaults to `nil`.
  public init(
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
  
  public var body: some View {
    InternalLottieView(
      name: name,
      animationProgress: $animationProgress,
      isPlaying: $isPlaying,
      animationSpeed: animationProgress,
      loopMode: loopMode,
      completion: completion
    )
  }
}
