# `.overlay`

![Screenshot 2023-10-10 at 6 33 52 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/8377b611-ef4d-4aaf-af86-29a02ba7fdb1)

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
            Text("Half-Year\nPlan")
                .multilineTextAlignment(.center)
                .font(.headline)
            Spacer()
            Text("Most Popular")
                .padding(4)
                .background(.green)
                .font(.footnote)
                .foregroundColor(.whiteAlways)
        }
        .padding()
        .frame(width: 120, height: 200)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.green, lineWidth: 2)
                .shadow(color: .blackBase, radius: 12)
        )
    }
}

#Preview {
    ContentView()
}
```
