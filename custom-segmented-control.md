# Custom Segmented Control 

![Screen Shot 2022-11-01 at 8 54 26 PM](https://user-images.githubusercontent.com/1819208/199369548-97bb70e5-868c-4688-8e02-792b5de3cafe.png)


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
                Button(action: changeSelection) {
                    Text("Progress")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: Constants.buttonHeight)
                        .foregroundColor(isLeftSelected ? .orange : .black)
                        .background(.clear)
                }
                Button(action: changeSelection) {
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
        }
    }

    private func changeSelection() {
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
