# SwiftUI

SwiftUI Sample Code.

![Screen Shot 2022-10-31 at 1 41 10 PM](https://user-images.githubusercontent.com/1819208/199073709-5de1df03-9e64-44c4-8784-cfe6f9177dca.png)


```swift
import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Image("swiftui-logo")
            Text("SwiftUI")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)
            Text("SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and surprisingly little code. You can bring even better experiences to everyone, on any Apple device, using just one set of tools and APIs.")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## Resources 

* [Apple: SwiftUI](https://developer.apple.com/xcode/swiftui/)
* [Apple: SwiftUI Videos](https://developer.apple.com/videos/all-videos/?q=swiftui)
* [Apple SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
* [Apple SwiftUI Concepts](https://developer.apple.com/tutorials/swiftui-concepts)
* [Apple Sample Code: Introducting SwiftUI](https://developer.apple.com/tutorials/SwiftUI)
* [Apple Sample Code: Exploring SwiftUI Sample Apps](https://developer.apple.com/tutorials/Sample-Apps)
* [Apple Sample Code: Food Truck: Building a SwiftUI multiplatform app](https://developer.apple.com/documentation/swiftui/food_truck_building_a_swiftui_multiplatform_app)
* [Apple Sample Code: Fruta: Building a Feature-Rich App with SwiftUI](https://developer.apple.com/documentation/swiftui/fruta_building_a_feature-rich_app_with_swiftui)
* [Apple Sampel Code: Create Accessible Views and more sample code](https://developer.apple.com/documentation/swiftui/creating_accessible_views)

