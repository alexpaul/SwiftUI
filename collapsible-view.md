# CollapsibleView 

<img width="1435" alt="Screen Shot 2023-02-20 at 9 17 42 AM" src="https://user-images.githubusercontent.com/1819208/220131767-3061de17-8003-4a6c-a922-9111b3666df9.png">


try? it out 

```swift
import SwiftUI

struct CollapsibleView: View {
    let summary: String
    let fullText: String

    @State private var isCollapsed = false

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(isCollapsed ? "Read less" : "Read more")
                    Image(systemName: isCollapsed ? "chevron.down" : "chevron.up")
                        .onTapGesture {
                            withAnimation {
                                isCollapsed.toggle()
                            }
                        }
                }
                .padding(.bottom, 10)
                Text(isCollapsed ? fullText : summary)
                    .shadow(radius: 0)
                    .animation(.linear(duration: 0.3), value: isCollapsed)
            }
            .frame(maxWidth: .infinity)
            .lineSpacing(10)
            .kerning(0.8)
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .background(.white)
            .shadow(radius: 12)
        }
        .padding(.horizontal, 20)
    }
}

struct ContentView: View {
    let summmary = "Alex Paul is a Software Engineer"

    let fullText = "Alex Paul is a Software Engineer who works at the New York Times Company writing iOS applications. Alex started his career as a Software Engineer in 2015. Prior to joining the Times, Alex taught iOS development to underrepresented individuals at Pursuit Transformation."

    var body: some View {
        VStack {
            CollapsibleView(
                summary: summmary,
                fullText: fullText
            )
            .padding(.top, 40)
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
