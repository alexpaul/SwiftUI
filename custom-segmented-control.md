# Custom Segmented Control 

https://user-images.githubusercontent.com/1819208/209889029-be6e4928-0829-493a-9184-c6acfea4565e.mov

try? it out 

```swift
import SwiftUI

struct SegmentedView: View {
    @State private var isLeftSelected = true

    var action: ((Bool) -> Void)?

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
                        .foregroundColor(isLeftSelected ? .orange : Color(uiColor: .label))
                    segmentedButton(title: "Activites", false)
                        .foregroundColor(isLeftSelected ? Color(uiColor: .label) : .orange)
                }
                .buttonStyle(.plain)
                ZStack {
                    segmentedDivider
                    selectedTabState(width: segmentedLineWidth)
                }
            }
        }
    }

    private var segmentedDivider: some View {
        HStack{}
            .frame(maxWidth: .infinity)
            .frame(height: 2)
            .background(Color(uiColor: .systemGray3))
            .offset(y: 2)
    }

    private func tabSelectionChanged(_ selection: Bool) {
        guard selection != isLeftSelected else { return }
        withAnimation {
            isLeftSelected.toggle()
        }
        action?(isLeftSelected)
    }

    private func selectedTabState(width: CGFloat) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            if isLeftSelected {
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
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(minHeight: Constants.buttonHeight)
                .background(Color(uiColor: .systemGroupedBackground))
        }
    }
}

struct ContentView: View {
    @State private var isLeftSelected = true

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            SegmentedView { isLeftSelected in
                self.isLeftSelected = isLeftSelected
            }
            .frame(height: 100)
            Spacer()
            Text(isLeftSelected ? "Viewing your Progress" : "Viewing your Activities")
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
