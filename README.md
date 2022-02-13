# FoggyColors

[![Version](https://img.shields.io/cocoapods/v/FoggyColors.svg?style=flat)](https://cocoapods.org/pods/FoggyColors)
[![License](https://img.shields.io/cocoapods/l/FoggyColors.svg?style=flat)](https://cocoapods.org/pods/FoggyColors)
[![Platform](https://img.shields.io/cocoapods/p/FoggyColors.svg?style=flat)](https://cocoapods.org/pods/FoggyColors)

<img src="https://github.com/AlexRoar/FoggyColors/raw/main/Assets/ExampleDemo.png">

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first. 

Or execute `pod try FoggyColors`

```swift
import SwiftUI
import FoggyColors

struct ContentView: View {
    var body: some View {
            FoggyColorsView(
              blurRadius: 64,
              globalOpacity: 0.6,
              elementOpacity: 0.4,
              animated: true,
              numberShapes: 5
            )
            .ignoresSafeArea()
    }
}
```

## Installation
### CocoaPods
FoggyColors is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FoggyColors'
```

### Swift PM

Just add this repository to your project in Xcode

## Author

alexdremov, dremov.me@gmail.com

## License

FoggyColors is available under the MIT license. See the LICENSE file for more info.
