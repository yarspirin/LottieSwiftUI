import XCTest
import SwiftUI
import Lottie
@testable import LottieSwiftUI

final class LottieSwiftUITests: XCTestCase {
  func testLottieViewCreation() {
    let lottieView = LottieView(filename: "ExampleAnimation")
    XCTAssertNotNil(lottieView)
  }
}
