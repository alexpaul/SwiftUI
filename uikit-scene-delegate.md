# Setting up `SceneDelegate`

## `SceneDelegate`

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: scene)
    let viewController = SwiftUIViewController(
        rootView: SwiftUIView()
    )
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
}
```
