# Using `ZStack`

## 1. Example

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

***

## 2. Example 

![Screen Shot 2023-01-23 at 6 28 20 PM](https://user-images.githubusercontent.com/1819208/214175448-1516fa95-fdb1-4a8f-9472-64963d1988e3.png)


try? it out 

```swift
import SwiftUI

struct CapsuleView: View {
    let messages: Int

    private let capsuleSize = CGSize(width: 40, height: 22)
    private let capsuleOffset = CGSize(width: 30, height: -40)

    var body: some View {
        Text(messages.description)
            .frame(height: capsuleSize.height)
            .padding(.horizontal, 8)
            .background(.red)
            .foregroundColor(.white)
            .font(.headline)
            .clipShape(Capsule())
            .offset(capsuleOffset)
    }
}

struct BubbleView: View {
    private let bubbleSize = CGSize(width: 52, height: 52)
    private let messageContainerSize = CGSize(width: 80, height: 80)

    var body: some View {
        Button(action: {}) {
            Image(systemName: "bubble.left.fill")
                .resizable()
                .frame(width: bubbleSize.width, height: bubbleSize.height)
                .foregroundColor(.white)
        }
        .frame(width: messageContainerSize.width, height: messageContainerSize.height)
        .background(.green)
        .cornerRadius(8)
    }
}

struct MessagesIcon: View {
    let messages: Int

    var body: some View {
        ZStack {
            BubbleView()
            if messages > 0 {
                CapsuleView(messages: messages)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        MessagesIcon(messages: 12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
