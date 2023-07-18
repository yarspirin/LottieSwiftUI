import SwiftUI
import Lottie

/// Lottie animation view available in SwiftUI.
public struct LottieView {
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
}

extension LottieView: UIViewRepresentable {
  public class Coordinator: NSObject {
    @Binding var animationProgress: AnimationProgressTime
    @Binding var isPlaying: Bool
    var completion: ((Bool) -> Void)?
    
    init(animationProgress: Binding<AnimationProgressTime>, isPlaying: Binding<Bool>, completion: ((Bool) -> Void)?) {
      _animationProgress = animationProgress
      _isPlaying = isPlaying
      self.completion = completion
    }
  }
  
  public func makeCoordinator() -> Coordinator {
    Coordinator(animationProgress: $animationProgress, isPlaying: $isPlaying, completion: completion)
  }
  
  public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> LottieAnimationView {
    let view = LottieAnimationView()
    view.animation = LottieAnimation.named(name)
    view.contentMode = .scaleAspectFit
    return view
  }
  
  public func updateUIView(_ uiView: LottieAnimationView, context: UIViewRepresentableContext<LottieView>) {
    uiView.animationSpeed = animationSpeed
    uiView.loopMode = loopMode
    uiView.currentProgress = animationProgress
    
    if isPlaying {
      uiView.play { finished in
        context.coordinator.completion?(finished)
        DispatchQueue.main.async {
          self.isPlaying = false
        }
      }
    } else {
      uiView.pause()
    }
  }
}
