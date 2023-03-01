# TextField 

![Screen Shot 2023-03-01 at 6 32 47 PM](https://user-images.githubusercontent.com/1819208/222291075-a22399e7-8100-4208-9b33-af89c204972b.png)


try? it out

```swift
struct ContentView: View {
    @State private var username = ""

    var body: some View {
        VStack {
            TextField("Please enter your username", text: $username)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
                .multilineTextAlignment(.center)
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

## Resources

* [Apple docs: `TextField`](https://developer.apple.com/documentation/swiftui/textfield)
