# Using `containerRelativeFrame`

> Use this modifier to specify a size for a view’s width, height, or both that is dependent on the size of the nearest container. Different things can represent a “container” including:
> 
> * The window presenting a view on iPadOS or macOS, or the screen of a device on iOS.
> 
> * A column of a NavigationSplitView
> 
> * A NavigationStack
> 
> * A tab of a TabView
> 
> * A scrollable view like ScrollView or List
> 
> The size provided to this modifier is the size of a container like the ones listed above subtracting any safe area insets that might be applied to that container.

[`containerRelativeFrame(_:alignment:)`](https://developer.apple.com/documentation/swiftui/view/containerrelativeframe(_:alignment:)?changes=_5)

## Example 1

![Screenshot 2024-06-16 at 9 27 43 AM](https://github.com/alexpaul/SwiftUI/assets/1819208/f9d08799-6f03-4cb2-ac6f-04050f497842)

try? it out 

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.orange)
                .containerRelativeFrame(.vertical) { height, _ in
                    height / 2
                }
        }
    }
}

#Preview {
    ContentView()
}
```

*** 

## Example 2 

![Screenshot 2024-06-16 at 10 03 31 AM](https://github.com/alexpaul/SwiftUI/assets/1819208/a31752e5-c011-4f48-bc98-60077910d11f)

try? it out 

```swift
struct Card: View {
    var headline: String

    var body: some View {
        VStack {
            Text(headline)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            .black,
            in: RoundedRectangle(cornerRadius: 24)
                .stroke(lineWidth: 1)
        )
        .padding(.horizontal, 20)
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<6) { item in
                Card(headline: item.description)
                    .containerRelativeFrame(.vertical) { height, _ in
                        height / 2
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
```

***

## Resources 

* [`containerRelativeFrame(_:alignment:)`](https://developer.apple.com/documentation/swiftui/view/containerrelativeframe(_:alignment:)?changes=_5)
