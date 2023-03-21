# Circle 

> Zwift inspired (Tour of Watopia 🚴🏾)

![Screen Shot 2023-03-21 at 6 22 25 PM](https://user-images.githubusercontent.com/1819208/226755346-845b0554-6049-45f3-962d-3287400dd41a.png)

try? it out

```swift
import SwiftUI

enum ColorState {
    case incomplete
    case complete

    var borderColor: Color {
        switch self {
        case .incomplete:
            return .white
        case .complete:
            return .red
        }
    }

    var innerCirColor: Color {
        switch self {
        case .incomplete:
            return .teal
        case .complete:
            return .yellow
        }
    }
}

struct Badge: Hashable {
    var text = ""
    var colorState: ColorState = .incomplete

    static var data: [Badge] {
        [
            .init(
                text: "1",
                colorState: .complete
            ),
            .init(
                text: "2",
                colorState: .complete
            ),
            .init(text: "3"),
            .init(text: "4"),
            .init(text: "5")
        ]
    }
}

struct BadgeView: View {
    let badge: Badge

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 40)
                .overlay {
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(badge.colorState.innerCirColor)
                }
            Text(badge.text)
                .font(.headline)
                .bold()
                .foregroundColor(badge.colorState.borderColor)
        }
        .foregroundColor(badge.colorState.borderColor)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(Badge.data, id: \.self) { badge in
                    BadgeView(badge: badge)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.teal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
