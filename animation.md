# Animation 

> Mario animations all inspired by my son's love for all things Mario. He can't wait for the Super Mario Bros movie coming April 2023. 

## Search Animation 

![mario-searching-ui](https://user-images.githubusercontent.com/1819208/212473166-d5460075-e6fd-498e-987f-1c55ac425fe6.gif)


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
                withAnimation(.easeInOut(duration: 0.5)) {
                    isSelected = index
                }
            }) {
                Text(title)
                    .frame(maxWidth: .infinity)
                    .frame(height: Constants.buttonHeight)
                    .foregroundColor(
                        Color(
                            uiColor: isSelected == index ? .label : .gray
                        )
                    )
            }
            .buttonStyle(.plain)
            Color(uiColor: isSelected == index ? .label : .clear)
                .frame(maxWidth: .infinity)
                .frame(height: Constants.selectedBarHeight)
        }
    }
}

struct ListItem: View {
    let imageName: String
    let itemName: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                Text(itemName)
            }
            .foregroundColor(imageName == "xmark" ? .gray : Color(uiColor: .label))
            .animation(.easeInOut(duration: 1), value: imageName)
        }
    }
}

struct Item: Identifiable {
    let image: String
    let name: String

    var id: UUID { UUID() }
}

struct CheckList: View {
    let items: [Item]

    var body: some View {
        List {
            ForEach(items) { item in
                ListItem(
                    imageName: item.image,
                    itemName: item.name
                )
            }
        }
    }
}

struct ContentView: View {
    private var titles = ["First", "Second"]

    @State private var isSelected = 0 // default is set to first tab

    private var firstChecklist: [Item] {
        [
            .init(image: "checkmark", name: "First Tab Item 1"),
            .init(image: "checkmark", name: "First Tab Item 2"),
            .init(image: "checkmark", name: "First Tab Item 3"),
            .init(image: "checkmark", name: "First Tab Item 4"),
            .init(image: "checkmark", name: "First Tab Item 5"),
        ]
    }

    private var secondChecklist: [Item] {
        [
            .init(image: "xmark", name: "Second Tab Item 1"),
            .init(image: "checkmark", name: "Second Tab Item 2"),
            .init(image: "xmark", name: "Second Tab Item 3"),
            .init(image: "xmark", name: "Second Tab Item 4"),
            .init(image: "xmark", name: "Second Tab Item 5"),
        ]
    }


    var body: some View {
        VStack {
            SegmentedControl(
                titles: titles,
                isSelected: $isSelected
            )
            Spacer()
            CheckList(items: isSelected == 0 ? firstChecklist : secondChecklist)
                .animation(.easeInOut(duration: 0.5), value: isSelected)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
