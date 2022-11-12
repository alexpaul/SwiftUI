# Previews 

The code below allows you to Preview on an iPhone and iPad. 

try? it out 
```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Apple docs: https://developer.apple.com/documentation/swiftui/view/previewdevice(_:)
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            .previewDisplayName("iPad Pro 12.9-inch 5th Gen")
    }
}
```

***

## Resources 

* [Apple docs: `previewdevice(_:)`](https://developer.apple.com/documentation/swiftui/view/previewdevice(_:))
