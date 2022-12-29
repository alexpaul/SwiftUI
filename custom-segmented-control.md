# Custom Segmented Control 

![Screen Shot 2022-12-29 at 11 57 03 AM](https://user-images.githubusercontent.com/1819208/209984848-5c1e4e4a-be36-49b2-81bb-27a2082ee6eb.png)


try? it out 

```swift
import SwiftUI

extension Color {
    static let segmentedBackgroundColor = Color(uiColor: .systemBackground)
}

struct SegmentedView: View {
    @State private var isLeftTabSelected = true

    var action: ((Bool) -> Void)

    private enum Constants {
        static let segmentedBorderHeight: Double = 4
        static let buttonHeight: Double = 44
    }

    var body: some View {
        GeometryReader { geometry in
            let segmentedLineWidth: CGFloat = geometry.size.width * 0.50
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center, spacing: 0) {
                    segmentedButton(title: "Progress", true)
                        .foregroundColor(isLeftTabSelected ? .orange : Color(uiColor: .label))
                    segmentedButton(title: "Activites", false)
                        .foregroundColor(isLeftTabSelected ? Color(uiColor: .label) : .orange)
                }
                .buttonStyle(.plain)
                ZStack {
                    segmentedDivider
                    updateTabState(width: segmentedLineWidth)
                }
            }
            .background(Color.segmentedBackgroundColor)
        }
        .frame(height: 48)
    }

    private var segmentedDivider: some View {
        Color(uiColor: .systemGray3)
            .frame(maxWidth: .infinity)
            .frame(height: 2)
            .offset(y: 2)
            .background(.clear)
    }

    private func tabSelectionChanged(_ selection: Bool) {
        guard selection != isLeftTabSelected else { return }
        withAnimation {
            isLeftTabSelected.toggle()
        }
        action(isLeftTabSelected)
    }

    private func updateTabState(width: CGFloat) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            if isLeftTabSelected {
                focusedTab(width: width)
                Spacer()
            } else {
                Spacer()
                focusedTab(width: width)
            }
        }
    }

    private func focusedTab(width: CGFloat) -> some View {
        HStack {}
            .frame(width: width)
            .frame(height: Constants.segmentedBorderHeight)
            .background(.orange)
    }

    private func segmentedButton(title: String, _ selection: Bool) -> some View {
        Button(action: { tabSelectionChanged(selection) }) {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(minHeight: Constants.buttonHeight)
                .background(Color.segmentedBackgroundColor)
        }
    }
}

struct ContentView: View {
    @State private var isLeftTabSelected = true

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            SegmentedView { isLeftTabSelected in
                self.isLeftTabSelected = isLeftTabSelected
            }
            Spacer()
            Text(isLeftTabSelected ? "Viewing your Progress" : "Viewing your Activities")
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
