# Using `@AppStore` 

> Apple docs: A property wrapper type that reflects a value from UserDefaults and invalidates a view on a change in value in that user default.

![Screen Shot 2022-10-31 at 5 41 42 PM](https://user-images.githubusercontent.com/1819208/199116064-2e01072e-f6d0-4613-84a3-6431ac526b9e.png)

try? it out

```swift
import SwiftUI

enum Theme: String {
    case light
    case dark

    var backgroundColor: Color {
        switch self {
        case .light:
            return .white
        case .dark:
            return .black
        }
    }

    var foregroundColor: Color {
        switch self {
        case .light:
            return .black
        case .dark:
            return .white
        }
    }

    var buttonTitle: String {
        switch self {
        case .light:
            return "Change to \(Theme.dark.rawValue)"
        case .dark:
            return "Change to \(Theme.light.rawValue)"
        }
    }

    var toggle: Theme {
        switch self {
        case .light:
            return .dark
        case .dark:
            return .light
        }
    }
}

struct ContentView: View {
    // 1
    // `@AppStorage` is a Property Wrapper around `UserDefaults` used to
    // persist "small" amounts of data
    // `UserDefaults` is not a recommended storage for large files
    @AppStorage("theme") var theme: String = Theme.light.rawValue

    private var currentTheme: Theme {
        Theme(rawValue: theme) ?? .light
    }

    var body: some View {
        VStack {
            Text("The default theme is \(theme)")
                .foregroundColor(currentTheme.foregroundColor)
                .padding(.bottom, 20)
            Button(currentTheme.buttonTitle) {
                // 2
                // Update the `UserDefault` `theme` key
                // Since `@AppStorage` also handles state,
                // the SwiftUI View will be updated
                theme = currentTheme.toggle.rawValue
            }
            .foregroundColor(currentTheme.foregroundColor)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 48)
                    .stroke(currentTheme.foregroundColor, lineWidth: 1)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(currentTheme.backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## Resources

* [Apple docs: `@AppStorage`](https://developer.apple.com/documentation/swiftui/appstorage)
