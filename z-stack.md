# Using `ZStack`

![Screen Shot 2022-11-03 at 11 15 18 AM](https://user-images.githubusercontent.com/1819208/199760613-307ab81c-5eea-446c-a3b4-f61f03d66a02.png)

try? it out

```swift
import SwiftUI

extension Color {
    static let backgroundColor = Color(red: 12/255, green: 25/255, blue: 66/255)
}

struct Banner: View {
    var body: some View {
        ZStack {
            bannerText(yOffset: 60, shadow: .blue)
            bannerText(yOffset: 45, shadow: .green)
            bannerText(yOffset: 30, shadow: .yellow)
            bannerText(yOffset: 15, shadow: .red)
            bannerText(isProminentBanner: true)
        }
    }

    private func bannerText(
        _ text: String = "NYC MARATHON SUNDAY",
        yOffset: Double = 0,
        isProminentBanner: Bool = false,
        shadow: Color = .clear
    ) -> some View {
        Text(text)
            .font(.title)
            .foregroundColor(isProminentBanner ? .white : .backgroundColor)
            .bold()
            .shadow(color: isProminentBanner ? .clear : shadow, radius: 4)
            .offset(y: yOffset)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
           Banner()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
