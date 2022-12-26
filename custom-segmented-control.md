# Custom Segmented Control 

![custom-segmented-control](https://user-images.githubusercontent.com/1819208/209569183-3280ad34-4ae3-4384-8adf-4f616b10f19a.gif)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    private enum Constants {
        static let segmentedBorderHeight: Double = 4
        static let buttonHeight: Double = 44
    }

    @State private var isLeftSelected = true

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
                    HStack{}
                        .frame(maxWidth: .infinity)
                        .frame(height: 2)
                        .background(Color(uiColor: .systemGray3))
                        .offset(y: 1)
                    HStack(alignment: .bottom, spacing: 0) {
                        if isLeftSelected {
                            segmentedLine(width: segmentedLineWidth)
                            Spacer()
                        } else {
                            Spacer()
                            segmentedLine(width: segmentedLineWidth)
                        }
                    }
                }
                Spacer()
                Text(isLeftSelected ? "Viewing your Progress" : "Viewing your Activities")
                Spacer()
            }
        }
    }

    private func changeSelection(_ selection: Bool) {
        guard selection != isLeftSelected else { return }
        withAnimation {
            isLeftSelected.toggle()
        }
    }

    private func segmentedLine(width: CGFloat) -> some View {
        HStack {}
            .frame(width: width)
            .frame(height: Constants.segmentedBorderHeight)
            .background(.orange)
    }

    private func segmentedButton(title: String, _ selection: Bool) -> some View {
        Button(action: { changeSelection(selection) }) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(minHeight: Constants.buttonHeight)
                .background(Color(uiColor: .systemGroupedBackground))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
