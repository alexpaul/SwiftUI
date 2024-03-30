# Loading `gif`'s in SwiftUI

> `gif` selection was inspired by my viewing of Godzilla x Kong with my son opening weekend (Godzilla tradition 😊) 👦🏾 ❤️.

![loading-gif-in-swiftui](https://github.com/alexpaul/SwiftUI/assets/1819208/7a5f6c77-2f97-4a8f-8cf6-083ec5d33e3c)

try? it out 

```swift
import SwiftUI
import WebKit

struct UIKitGifView: UIViewRepresentable {
    let name: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let data: Data

        guard let url = Bundle.main.url(forResource: name, withExtension: "gif") else {
            fatalError("Resource \(name).gif not found in the main bundle.")
        }
        do {
            data = try Data(contentsOf: url)
        } catch {
            fatalError("Failed to load data from URL: \(url)")
        }

        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Godzilla x Kong")
                .font(.headline)
            UIKitGifView(name: "godzilla")
                .frame(width: 300, height: 200)
            Text("Only in Theatres")
            Text("MARCH 29")
                .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
```
