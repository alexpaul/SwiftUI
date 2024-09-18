# Custom Page Control

If you're here, you're likely looking for a custom control to replace the default page dots in SwiftUI. This Custom Page Control provides a tailored solution for that. 

## CustomPageControl.swift

```swift
struct CustomPageControl<Content: View>: View {
    @Binding var currentIndex: Int
    let numberOfPages: Int
    var foregroundColor: Color = .blackBase
    var applyForegroundColor = false
    @ViewBuilder let content: Content

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(0..<numberOfPages), id: \.self) { index in
                HStack {
                    Button {
                        withAnimation {
                            currentIndex = index
                        }
                    } label: {
                        if numberOfPages > 1 {
                            if applyForegroundColor {
                                content
                                    .foregroundStyle(
                                        currentIndex == index
                                        ? foregroundColor
                                        : foregroundColor.opacity(0.3)
                                    )
                            } else {
                                content
                            }
                        }
                    }
                }
            }
        }
    }
}
```

***

## DemoTabView utilizing the CustomPageControl 

```swift
struct DemoTabView: View {
    @State private var selectedTab = 0

    private var numberOfPages: Int { 4 }

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ForEach(0..<numberOfPages, id: \.self) { page in
                    Text("\(page + 1)")
                        .font(.largeTitle)
                        .tag(page)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            CustomPageControl(
                currentIndex: $selectedTab,
                numberOfPages: numberOfPages,
                foregroundColor: .orange,
                applyForegroundColor: true) {
                    Rectangle()
                        .frame(width: 20, height: 8)
                        .padding(8)
                }
        }
    }
}

#Preview {
    DemoTabView()
}
```
