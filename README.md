# LottieSwiftUI

LottieSwiftUI is a powerful and easy-to-use package that brings Lottie animations to the SwiftUI world. With just a few lines of code, you can add stunning animations to your SwiftUI applications, improving user engagement and user interface aesthetics.

Lottie is a library for iOS, Android, and Web that parses Adobe After Effects animations exported as json and renders them natively!

<img src="https://raw.githubusercontent.com/mountain-viewer/LottieSwiftUI/master/Resources/sample.gif" height="300">

## Features

- Display Lottie animations in SwiftUI
- Configure animation loop mode
- Configure animation speed

## Installation

This package uses Swift Package Manager, which is integrated with Xcode. Here's how you can add **LottieSwiftUI** to your project:

1. In Xcode, select "File" > "Swift Packages" > "Add Package Dependency"
2. Enter the URL for this repository (https://github.com/mountain-viewer/LottieSwiftUI)

## Usage

Here's an example of how you can use `LottieView` in your SwiftUI code:

```swift
LottieView(name: "your_animation", animationSpeed: 1.0, loopMode: .loop)
```

Replace "your_animation" with the name of your animation file (without the .json extension).

## Requirements
- iOS 13.0+
- Xcode 14.0+
- Swift 5.7+

## Contributing
Contributions are welcome! If you have a bug to report, a feature to request, or have the desire to contribute in another way, feel free to file an issue.

## License
LottieSwiftUI is available under the MIT license. See the LICENSE file for more info.
