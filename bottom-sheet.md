# Bottom Sheet using `presentationDetents`

> Note: `presentationDetents` is available in iOS 16+

## 1. Example 

![Screen Shot 2023-01-25 at 9 09 07 PM](https://user-images.githubusercontent.com/1819208/214742369-2d019134-94b8-4bbb-8cd5-92382cbba87c.png)

![Screen Shot 2023-01-25 at 9 11 27 PM](https://user-images.githubusercontent.com/1819208/214742516-3e850899-24c8-4b9e-aba0-622a5915ab6f.png)

![Screen Shot 2023-01-25 at 9 11 39 PM](https://user-images.githubusercontent.com/1819208/214742530-ef2bfe45-d58f-4155-8a28-51459f94014f.png)

try? it out

```swift
import SwiftUI

struct ContactsView: View {
    private var names = [
        "Reginald", "Holman", "Elexis", "Gardner",
        "Hakeem", "Flynn", "Hayleigh", "Holton",
        "Mario", "Garber", "Norman", "Longo",
        "Zara", "Newkirk", "Leilani", "Hopper",
        "Diego", "Cheney", "Joel", "Comstock"
    ]
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            // Available in iOS16+
            .scrollIndicators(.hidden)
            HStack {
                Button(action: {}) {
                    Text("Send")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(.blue)
                .cornerRadius(12)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct ContentView: View {
    @State private var message = ""
    @State private var isPresented = false

    var body: some View {
        VStack {
            Spacer()
            Image("xrOS")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            HStack {
                TextField("Send Message", text: $message)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Image(systemName: "paperplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .padding()
                    .onTapGesture {
                        isPresented.toggle()
                    }
                    .sheet(isPresented: $isPresented) {
                        ContactsView()
                            // Available in iOS16+
                            .presentationDetents([
                                .medium,
                                .large
                            ])
                    }
            }
            .frame(height: 80)
            .background(.orange)
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

## 1. Example 

..work in progress

```swift
import SwiftUI

struct RadioButton: View {
    @State private var isSelected = false

    var body: some View {
        Circle()
            .strokeBorder(.gray, lineWidth: 2)
            .background(
                Circle()
                    .frame(width: 14, height: 14)
                    .foregroundColor(isSelected ? .blue : .clear)
            )
            .frame(width: 24, height: 24)
            .onTapGesture {
                isSelected.toggle()
            }
    }
}

struct PreferenceView: View {
    let imageName: String
    let preferenceTitle: String

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Image(imageName)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(22)
                Text(preferenceTitle)
                Spacer()
                RadioButton()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ProfileList: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Text("Your Preferences")
                    .font(.headline)
                    .padding(.top, 40)
                Divider()
                PreferenceView(imageName: "swift", preferenceTitle: "Swift")
                PreferenceView(imageName: "wakanda", preferenceTitle: "Wakanda")
            }
        }
    }
}

struct ContentView: View {
    @State private var isPresented = true

    var body: some View {
        VStack {
            Button(action: {
                isPresented.toggle()
            }) {
                Text("Change Preference")
            }
            .sheet(isPresented: $isPresented) {
                ProfileList()
                    .presentationDetents([
                        .fraction(0.3),
                        .medium,
                        .large
                    ])
            }
            Image("swift")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
