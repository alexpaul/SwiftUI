# Custom Segmented Control 

![segmented-control](https://user-images.githubusercontent.com/1819208/210283023-5fcd47e8-0a02-4421-9385-d46361163178.png)

try? it out 

```swift
import SwiftUI

struct SegmentedControl: View {
    let titles: [String]

    @Binding var isSelected: Int

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(
                Array(titles.enumerated()),
                id: \.offset
            ) { index, title in
                SegmentedButton(
                    title: title,
                    index: index,
                    isSelected: $isSelected
                )
            }
        }
    }
}

struct SegmentedButton: View {
    let title: String
    let index: Int

    @Binding var isSelected: Int

    private enum Constants {
        static let buttonHeight: CGFloat = 50
        static let selectedBarHeight: CGFloat = 4
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Button(action: {
                isSelected = index
            }) {
                Text(title)
                    .frame(maxWidth: .infinity)
                    .frame(height: Constants.buttonHeight)
                    .foregroundColor(
                        Color(
                            uiColor: isSelected == index ? .orange : .label
                        )
                    )
            }
            .buttonStyle(.plain)
            Color(uiColor: isSelected == index ? .orange : .clear)
                .frame(maxWidth: .infinity)
                .frame(height: Constants.selectedBarHeight)
        }
    }
}

struct ContentView: View {
    private var titles = ["First", "Second", "Third", "Fourth"]

    @State private var isSelected = 0 // default is set to first tab

    var body: some View {
        VStack {
            SegmentedControl(
                titles: titles,
                isSelected: $isSelected
            )
            Spacer()
            Text("\(titles[isSelected]) tab selected")
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
