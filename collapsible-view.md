# CollapsibleView 

<img width="1436" alt="Screen Shot 2023-02-20 at 9 07 28 AM" src="https://user-images.githubusercontent.com/1819208/220129646-a5e542dd-7c27-4173-8377-f0b6fbda4046.png">

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
                        .multilineTextAlignment(.center)
                    Image(systemName: isCollapsed ? "chevron.down" : "chevron.up")
                        .onTapGesture {
                            isCollapsed.toggle()
                        }
                }
                .padding(.bottom, 10)
                Text(isCollapsed ? fullText : summary)
                    .shadow(radius: 0)
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
