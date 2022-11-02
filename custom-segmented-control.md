# Custom Segmented Control 

![Screen Shot 2022-11-02 at 5 57 53 AM](https://user-images.githubusercontent.com/1819208/199460252-161f125b-2986-4317-ac83-cd4baf2fcb2c.png)


```swift
import SwiftUI

struct ContentView: View {
    private enum Constants {
        static let segmentedBorderHeight: Double = 4
        static let buttonHeight: Double = 44
    }

    @State private var isLeftSelected = true

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Button(action: { changeSelection(true) }) {
                    Text("Progress")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: Constants.buttonHeight)
                        .foregroundColor(isLeftSelected ? .orange : .black)
                        .background(.clear)
                }
                Button(action: { changeSelection(false) }) {
                    Text("Activities")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: Constants.buttonHeight)
                        .foregroundColor(isLeftSelected ? .black : .orange)
                        .background(.clear)
                }
            }
            ZStack {
                HStack{}
                    .frame(maxWidth: .infinity)
                    .frame(height: 2)
                    .background(Color(uiColor: .systemGray3))
                    .offset(y: 1)
                HStack(alignment: .center, spacing: 0) {
                    HStack {}
                    .frame(maxWidth: .infinity)
                    .frame(height: Constants.segmentedBorderHeight)
                    .background(isLeftSelected ? .orange : .clear)
                    HStack {}
                    .frame(maxWidth: .infinity)
                    .frame(height: Constants.segmentedBorderHeight)
                    .background(isLeftSelected ? .clear : .orange)
                }
            }
            Spacer()
            Text(isLeftSelected ? "Viewing your Progress" : "Viewing your Activities")
            Spacer()
        }
    }

    private func changeSelection(_ selection: Bool) {
        guard selection != isLeftSelected else { return }
        withAnimation {
            isLeftSelected.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
