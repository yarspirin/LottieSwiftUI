import SwiftUI
import Lottie

public struct LottieView {
  let name: String
  let loopMode: LottieLoopMode
  
  public init(name: String, loopMode: LottieLoopMode = .loop) {
    self.name = name
    self.loopMode = loopMode
  }
}

extension LottieView: UIViewRepresentable {
  public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> LottieAnimationView {
    let view = LottieAnimationView()
    view.animation = LottieAnimation.named(name)
    view.contentMode = .scaleAspectFill
    return view
  }
  
  public func updateUIView(_ uiView: LottieAnimationView, context: UIViewRepresentableContext<LottieView>) {
    uiView.loopMode = loopMode
    uiView.play()
  }
}
