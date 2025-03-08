# Setting up `SceneDelegate`

## `SceneDelegate`

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: scene)
    // Assumption is that you're created the following files:
    // `ContentView`
    // `ContentViewController`
    let viewController = ContentViewController(
        rootView: ContentView()
    )
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
}
```
