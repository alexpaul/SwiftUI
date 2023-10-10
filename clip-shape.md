# `clipShape`

![Screenshot 2023-10-10 at 6 14 52 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/5cc98f61-3537-41e8-9229-666a5175b245)

try? it out 

```swift
//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .padding(40)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 200)
        .background(.orange)
        .clipShape(
            Circle()
        )
    }
}

#Preview {
    ContentView()
}
```
