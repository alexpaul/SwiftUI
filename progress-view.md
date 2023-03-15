# ProgressView

![Screen Shot 2023-03-01 at 2 06 51 PM](https://user-images.githubusercontent.com/1819208/222239888-e7c8fd53-07eb-4423-9ad1-7fdcbc34c70e.png)


try? it out

```swift
import SwiftUI

struct CustomButton: View {
    let title: String

    var body: some View {
        Button(action: {}) {
            Text(title)
                .foregroundColor(.black)
                .padding()
        }
        .overlay{
            RoundedRectangle(cornerRadius: 12)
                .stroke(.black, lineWidth: 1)
        }
    }
}

struct ButtonList: View {
    var body: some View {
        VStack {
            CustomButton(title: "Button 1")
            CustomButton(title: "Button 2")
        }
    }
}

struct ContentView: View {
    let timer = Timer.publish(
        every: 5,
        on: .main,
        in: .common
    ).autoconnect()

    @State private var counter = 0

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Some View")
            if counter == 0 {
                ZStack {
                    ButtonList()
                        .opacity(0)
                    ProgressView()
                }
            } else {
                ZStack {
                    ButtonList()
                        .opacity(1)
                }
            }
            Text("Some Other View")
        }
        .onReceive(timer) { time in
            if counter == 1 {
                timer.upstream.connect().cancel()
            }
            counter += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```