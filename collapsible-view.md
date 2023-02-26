# CollapsibleView 

![Screen Shot 2023-02-25 at 9 13 50 PM](https://user-images.githubusercontent.com/1819208/221388534-a26d5214-d181-44cc-86be-15f8cc8b6d49.png)


try? it out 

```swift
import SwiftUI

struct CollapsibleView: View {
    let summary: String
    let fullText: String

    @Environment(\.colorScheme) private var colorScheme

    @State private var isCollapsed = false

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Button(action: {
                    withAnimation {
                        isCollapsed.toggle()
                    }
                }) {
                    HStack {
                        Text(isCollapsed ? "Read less" : "Read more")
                        Spacer()
                        Image(systemName: isCollapsed ? "chevron.down" : "chevron.up")
                    }
                    .foregroundColor(foregroundColor)
                }
                .padding(.bottom, 10)
                Text(isCollapsed ? fullText : summary)
                Divider()
                    .padding(.vertical, 20)
                HStack {
                    Spacer()
                    Text("© 2023 alexpaul.dev")
                    Spacer()
                }
            }
            .lineSpacing(10)
            .kerning(0.8)
            .padding(20)
        }
        .background(background)
        .border(border, width: 1)
        .shadow(radius: 12)
        .padding(.horizontal, 20)
    }

    private var background: Color {
        colorScheme == .light ? .white : .black
    }

    private var foregroundColor: Color {
        colorScheme == .light ? .black : .white
    }

    private var border: Color {
        colorScheme == .light ? .black.opacity(0.4) : .white.opacity(0.4)
    }
}

struct ContentView: View {
    let summmary = "Alex Paul is a Software Engineer"

    let fullText = "Alex Paul is a Software Engineer who works at the New York Times Company writing iOS applications. Alex started his career as a Software Engineer in 2015. Prior to joining the Times, Alex taught iOS development to underrepresented individuals at Pursuit Transformation."

    var body: some View {
        ScrollView {
            CollapsibleView(
                summary: summmary,
                fullText: fullText
            )
            .padding(.top, 60)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
