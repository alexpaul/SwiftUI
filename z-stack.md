# Using `ZStack`

## Resources

* [Apple docs: `ZStack`](https://developer.apple.com/documentation/swiftui/zstack)
* [Apple docs: Making fine adjustments to a view’s position](https://developer.apple.com/documentation/swiftui/making-fine-adjustments-to-a-view-s-position)

***

## 1. Example 

<img width="1330" alt="Screen Shot 2023-02-12 at 9 23 18 PM" src="https://user-images.githubusercontent.com/1819208/218356498-fdc041f7-bf3a-479d-b07b-0cc6f165ed1d.png">

try? it out 

```swift
import SwiftUI

extension Color {
  static var topView: Self { .yellow }
  static var secondView: Self { .teal }
  static var parentView: Self { .red }
}

struct ContentView: View {
  var body: some View {
    VStack {
      Text("ZStack Hierarchy")
        .font(.title)
        .underline()
      VStack {
        HStack {
          Text("(3)")
          Spacer()
          Text("`Rectange`")
        }
        .frame(width: 200, height: 4)
        .padding()
        
        Rectangle()
          .frame(width: 200, height: 4)
          .foregroundColor(.topView)
        HStack {
          Text("(2)")
          Spacer()
          Text("`VStack`")
        }
        Rectangle()
          .frame(height: 4)
          .foregroundColor(.secondView)
          .padding(.bottom, 10)
        HStack {
          Text("(1)")
          Spacer()
          Text("`ZStack`")
        }
        Rectangle()
          .frame(height: 4)
          .foregroundColor(.parentView)
      }
      .padding(20)
      // (1)
      ZStack {
        // (2)
        VStack {
          HStack {
            Text("Top Left")
            Spacer()
            Text("Top Right")
          }
          .padding()
          Spacer()
          HStack {
            Text("Bottom Left")
            Spacer()
            Text("Bottom Right")
          }
          .padding()
        }
        .background(Color.secondView)
        // (3)
        Rectangle()
          .frame(width: 200, height: 200)
          .foregroundColor(.topView)
          .overlay(Text("Center of ZStack "))
      }
      .frame(width: 400, height: 400)
      .background(Color.parentView)
    }
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

## 3. Example 

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
