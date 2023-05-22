# TextField 

## 1. `TextField` and `SecureField`

![Screen Shot 2023-03-01 at 6 42 18 PM](https://user-images.githubusercontent.com/1819208/222292240-f164411c-114c-4328-9f1a-abb4b7189d48.png)


try? it out

```swift
import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField("Please enter your username", text: $username)
            SecureField("Please enter your password", text: $password)
        }
        .frame(width: 300)
        .multilineTextAlignment(.center)
        .textFieldStyle(.roundedBorder)
        .autocapitalization(.none)
        .autocorrectionDisabled(true)
        .padding(20)
        .background(.teal)
        .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## 2. Custom `TextFieldStyle` 

![Screen Shot 2023-03-01 at 6 54 38 PM](https://user-images.githubusercontent.com/1819208/222294144-f1705dd3-9492-4e02-9f6a-97d67303f772.png)

```swift
import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(20)
            .foregroundColor(.white)
            .bold()
            .kerning(0.8)
            .background(.orange)
            .autocapitalization(.none)
            .autocorrectionDisabled(true)
            .cornerRadius(24)
            .multilineTextAlignment(.center)
            .shadow(radius: 12)
    }
}

struct ContentView: View {
    @State private var username = ""

    var body: some View {
        VStack {
            TextField("Enter your username", text: $username)
                .textFieldStyle(CustomTextFieldStyle())
        }
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

***

## 3. Tip Calculator 

![Screenshot 2023-05-22 at 5 33 11 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/4efb7b31-5efe-4687-921b-ea8e44bdca19)


try? it out 

```swift
import SwiftUI

struct TipTextField: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(20)
            .foregroundColor(.black)
            .background(.orange.opacity(0.5))
            .cornerRadius(8)
    }
}

struct ContentView: View {
    @State private var billAmount = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Calculate Tip")
            TextField(
                "0",
                text: $billAmount
            )
            .textFieldStyle(TipTextField())
            Text(tipAmount)
                .font(.system(.title, weight: .bold))
        }
        .padding(.horizontal, 20)
    }

    private var tipAmount: String {
        guard let amount = Double(billAmount),
            amount > 0 else {
            return "Tip"
        }
        return String(format: "Tip Amount: $%.2f", amount * 0.15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## Resources

* [Apple docs: `TextField`](https://developer.apple.com/documentation/swiftui/textfield)
