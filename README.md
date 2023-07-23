# LottieSwiftUI

A Swift package that provides a SwiftUI interface to the popular [Lottie](https://airbnb.design/lottie/) animation library. The LottieSwiftUI package allows you to easily add and control Lottie animations in your SwiftUI project. It offers a clean and easy-to-use API with customizable options like animation speed and loop mode.

<img src="https://raw.githubusercontent.com/mountain-viewer/LottieSwiftUI/master/Resources/sample.gif" height="300">

## Features

- Swift/SwiftUI native integration.
- Customize animation speed.
- Choose loop mode: play once, loop, or auto reverse.
- Clean, organized, and thoroughly documented code.
- Efficient and performance-optimized design.

## Installation

This package uses Swift Package Manager, which is integrated with Xcode. Here's how you can add **LottieSwiftUI** to your project:

1. In Xcode, select "File" > "Swift Packages" > "Add Package Dependency"
2. Enter the URL for this repository (https://github.com/yarspirin/LottieSwiftUI)

## Usage

Here's an example of how you can use `LottieView` in your SwiftUI code:

```swift
import SwiftUI
import LottieSwiftUI

struct ContentView: View {
  var body: some View {
    LottieView(
      name: "london_animation", // Replace with your Lottie animation name
      animationSpeed: 1.0,
      loopMode: .loop
    )
  }
}
```

<img src="https://raw.githubusercontent.com/mountain-viewer/LottieSwiftUI/master/Resources/sample.gif" height="300">

Properties:

- name: The name of the Lottie animation file (without the file extension). This file should be added to your project's assets.
- animationSpeed: The speed of the animation. It should be a CGFloat value, where 1.0 represents the normal speed. Defaults to 1.0.
- loopMode: The loop mode for the animation. Default is LottieLoopMode.playOnce. Other options include .loop and .autoReverse.

## Requirements
- iOS 13.0+
- Xcode 14.0+
- Swift 5.7+

## Contributing
Contributions are welcome! If you have a bug to report, a feature to request, or have the desire to contribute in another way, feel free to file an issue.

## License
LottieSwiftUI is available under the MIT license. See the LICENSE file for more info.
