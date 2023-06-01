# `@State` and `@Binding`

## Example 1

![Screenshot 2023-05-31 at 8 56 04 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/d48f256b-5fd7-458c-ae34-9d03e0e3670a)


try? it out 

```swift
import SwiftUI

struct ActionButton: View {
    let title: String

    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
        }
        .background(.purple)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

struct ButtonNavigation: View {
    @State private var values = Array(0...10)
    @Binding var start: Int

    var body: some View {
        HStack(spacing: 40) {
            ActionButton(title: "Previous") { decrement() }
            ActionButton(title: "Next") { increment() }
        }
        .padding(.horizontal, 20)
        .onAppear {
            start = values[start]
        }
    }

    private func increment() {
        guard start < values.count - 1 else {
            return
        }
        start = values[start + 1]
    }

    private func decrement() {
        guard start > 0 else {
            return
        }
        start = values[start - 1]
    }
}

struct ContentView: View {
    @State private var start = 0

    var body: some View {
        VStack {
            Text("\(start)")
                .font(.largeTitle)
            ButtonNavigation(start: $start)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## Example 2

![Screenshot 2023-05-21 at 2 21 57 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/8e7aa625-bcea-490d-885d-cdd1f03f257b)

try? it out 

```swift
//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul
//

import SwiftUI

struct DiePoint: View {
    var body: some View {
        Circle()
            .frame(width: 10)
            .padding(4)
    }
}

struct Dice: View {
    @Binding var count: Int

    var body: some View {
        VStack {
            switch count {
            case 1:
                DiePoint()
            case 2:
                HStack {
                    DiePoint()
                    DiePoint()
                }
            case 3:
                DiePoint()
                HStack {
                    DiePoint()
                    DiePoint()
                }
            case 4:
                HStack {
                    DiePoint()
                    DiePoint()
                }
                HStack {
                    DiePoint()
                    DiePoint()
                }
            case 5:
                HStack {
                    DiePoint()
                    DiePoint()
                }
                DiePoint()
                HStack {
                    DiePoint()
                    DiePoint()
                }
            case 6:
                HStack {
                    DiePoint()
                    DiePoint()
                }
                HStack {
                    DiePoint()
                    DiePoint()
                }
                HStack {
                    DiePoint()
                    DiePoint()
                }
            default:
                EmptyView()
            }
        }
        .frame(width: 80, height: 80)
        .background(.teal)
        .cornerRadius(4)
        .shadow(radius: 8)
    }
}

struct ContentView: View {
    @State private var count = Int.random(in: 1...6)
    @State private var isButtonDisabled = false

    var body: some View {
        VStack {
            Dice(count: $count)
                .padding(.bottom, 40)
            Button(action: {
                count = Int.random(in: 1...6)
                isButtonDisabled = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isButtonDisabled = false
                }
            }) {
                Text("Roll Dice")
                    .font(.headline)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(isButtonDisabled ? .green.opacity(0.6) : .green)
                    .foregroundColor(.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.clear, lineWidth: 1)
            }
            .disabled(isButtonDisabled)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
