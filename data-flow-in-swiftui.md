# Handling Data in SwiftUI: Using `ObservableObject`, `@Published`, `StateObject`,`.environmentObject(_:)` and `EnvironmentObject`

This SwiftUI sample app uses the above mentioned modifiers and Property Wrappers to add / delete selected colors to and from the "Favorites" tab.

![Screen Shot 2022-10-25 at 4 49 34 PM](https://user-images.githubusercontent.com/1819208/197879179-e8aba439-1012-446d-b04a-9cccd8fb5d1f.png)

![Screen Shot 2022-10-25 at 4 49 55 PM](https://user-images.githubusercontent.com/1819208/197879207-a10981df-ef54-475b-a485-d78651b8b540.png)


## 1. `ObservableObject` and `@Published`

```swift
import SwiftUI

@main
struct SwiftUIPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            MainApp()
        }
    }
}
```

```swift
import SwiftUI

// Apple docs:
// https://developer.apple.com/documentation/combine/observableobject
final class Favorites: ObservableObject {
    // Apple docs:
    // https://developer.apple.com/documentation/combine/published
    @Published var colors = [Color]()

    func add(_ color: Color) {
        colors.append(color)
    }

    func remove(at index: Int) {
        colors.remove(at: index)
    }
}
```

***

## 2. `StateObject` and `.environmentObject(_:)`


```swift
import SwiftUI

struct MainApp: View {
    // Apple docs:
    // https://developer.apple.com/documentation/swiftui/stateobject
    @StateObject var favorites = Favorites()

    var body: some View {
        TabView {
            ContentView()
                // Apple docs:
                // https://developer.apple.com/documentation/swiftui/view/environmentobject(_:)
                .environmentObject(favorites)
                .tabItem {
                    Label("Home", systemImage: "paintpalette")
                }
            FavoritesView()
                .environmentObject(favorites)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

struct MainApp_Previews: PreviewProvider {
    static var previews: some View {
        MainApp()
    }
}
```


## 3. `@EnvironmentObject`

```swift
import SwiftUI

struct ContentView: View {
    // Apple docs:
    // https://developer.apple.com/documentation/swiftui/environmentobject
    @EnvironmentObject var favorites: Favorites

    private let colors: [Color] = [.red,
                                   .orange,
                                   .yellow,
                                   .green,
                                   .blue,
                                   .indigo,
                                   .purple
    ]

    var body: some View {
        List(colors, id: \.self) { color in
            ColorRow(color: color)
                .onTapGesture {
                    favorites.add(color)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

```swift
import SwiftUI

struct FavoritesView: View {
    // Apple docs:
    // https://developer.apple.com/documentation/swiftui/environmentobject
    @EnvironmentObject var favorites: Favorites

    var body: some View {
        List {
            ForEach(Array(favorites.colors.enumerated()), id: \.offset) { index, color in
                ColorRow(color: color)
                    .background(color)
                    .onTapGesture {
                        withAnimation {
                            favorites.remove(at: index)
                        }
                    }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
```

```swift
import SwiftUI

struct ColorRow: View {
    let color: Color

    var body: some View {
        HStack {}
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(color)
    }
}

struct ColorRow_Previews: PreviewProvider {
    static var previews: some View {
        ColorRow(color: .red)
    }
}
```

***

> Note: Ensure your SwiftUI Previews that depend on `EnvironmentObject` have the `.environmentObject(SomeView())` modifier or you will experience Previews crashing.

## Resources 

* [Apple docs: `ObservableObject`](https://developer.apple.com/documentation/combine/observableobject)
* [Apple docs: `@Published`](https://developer.apple.com/documentation/combine/published)
* [Apple docs: `StateObject`](https://developer.apple.com/documentation/swiftui/stateobject)
* [Apple docs: `.environmentObject(_:)`](https://developer.apple.com/documentation/swiftui/view/environmentobject(_:))
* [Apple docs: `@EnvironmentObject`](https://developer.apple.com/documentation/swiftui/environmentobject)

