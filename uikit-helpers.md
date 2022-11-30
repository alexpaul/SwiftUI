# `UIKit` Helpers


## 1. Remove the "Back" Text from the Navigation Bar
```swift
extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
```
