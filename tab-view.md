# `TabView`

![tab-view](https://github.com/alexpaul/SwiftUI/assets/1819208/568763d9-b4df-4f6e-90d7-613d00c931a4)

try? it out

```swift
//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul
//

import SwiftUI

struct Shoe: Hashable {
    var imageName: String

    static var data: [Shoe] {
        [
            Shoe(imageName: "bondi-8-black"),
            Shoe(imageName: "bondi-8-orange"),
            Shoe(imageName: "rocket-x-2-black"),
            Shoe(imageName: "rocket-x-2-green")
        ].shuffled()
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            ForEach(Shoe.data, id: \.self) { shoe in
                Image(shoe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
