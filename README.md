# SwiftUI

This repo contains SwiftUI code which showcases [View](https://developer.apple.com/documentation/swiftui/view) components like `List`, `AsyncImage`, [Property Wrappers](https://developer.apple.com/documentation/swiftui/model-data) like [@Binding](binding.md) and much more SwiftyUI snacks. I've also created a few sample SwiftUI apps which you will find below. `Text("Enjoy!")`

Throughout this repo you'll come across "try? it out" code snippets, copy, paste into a SwiftUI `ContentView` or similar test View.

***

## Questions to keep in mind when designing a SwiftUI View 

* What data does the view need? 
* How will it use that data? 
* Where does the data come from? 

> Questions from [Data Essentials in SwiftUI - WWDC20](https://developer.apple.com/videos/play/wwdc2020/10040/)

***

![Screen Shot 2022-10-31 at 1 41 10 PM](https://user-images.githubusercontent.com/1819208/199073709-5de1df03-9e64-44c4-8784-cfe6f9177dca.png)


try? it out

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

***

## My Sample SwiftUI Apps 

* [ZwiftRoutes](https://github.com/alexpaul/ZwiftRoutes/)
* [WorldCup2022](https://github.com/alexpaul/WorldCup2022/)
* [WWDCKit - Creating and Using a Swift Package](https://github.com/alexpaul/WWDCKit)
* [Vocabulary](https://github.com/alexpaul/Vocabulary/)
* [BookList](https://github.com/alexpaul/BookList/)
* [MoviesApp](https://github.com/alexpaul/phanmovies)

***

## SwiftUI @ WWDC 

2022
* [Use SwiftUI with UIKit - WWDC22](https://developer.apple.com/videos/play/wwdc2022/10072/)

2021 
* [Demystifying SwiftUI - WWDC21](https://developer.apple.com/videos/play/wwdc2021/10022/)

2020  
* [Introduction to SwiftUI - WWDC20](https://developer.apple.com/videos/play/wwdc2020/10119)
* [Data essentials in SwiftUI - WWDC20](https://developer.apple.com/videos/play/wwdc2020/10040/) ⭐️



## Apple SwiftUI Resources 

* [Apple: SwiftUI](https://developer.apple.com/xcode/swiftui/)
* [Apple: SwiftUI Videos](https://developer.apple.com/videos/all-videos/?q=swiftui)
* [Apple SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
* [Apple SwiftUI Concepts](https://developer.apple.com/tutorials/swiftui-concepts)
* [Apple Sample Code: Introducting SwiftUI](https://developer.apple.com/tutorials/SwiftUI)
* [Apple Sample Code: Exploring SwiftUI Sample Apps](https://developer.apple.com/tutorials/Sample-Apps)
* [Apple Sample Code: Food Truck: Building a SwiftUI multiplatform app](https://developer.apple.com/documentation/swiftui/food_truck_building_a_swiftui_multiplatform_app)
* [Apple Sample Code: Fruta: Building a Feature-Rich App with SwiftUI](https://developer.apple.com/documentation/swiftui/fruta_building_a_feature-rich_app_with_swiftui)
* [Apple Sample Code: Create Accessible Views and more sample code](https://developer.apple.com/documentation/swiftui/creating_accessible_views)

***

<a href="https://www.buymeacoffee.com/alexpaulnyc" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"> If any of the info here was valuable in your SwiftUI quest.</a>


