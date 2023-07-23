//
//  LottieSwiftUITests.swift
//
//
//  Created by Yaroslav Spirin on 18.07.2023.
//

import XCTest
import SwiftUI
import Lottie
@testable import LottieSwiftUI

final class LottieSwiftUITests: XCTestCase {
  func testLottieViewCreation() {
    let lottieView = LottieView(name: "ExampleAnimation", playbackState: .constant(.playing))
    XCTAssertNotNil(lottieView)
  }
}
