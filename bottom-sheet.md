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

## 2. Example 

work in progress...

```swift
import SwiftUI

struct Profile {
    let image: String
    let name: String

    static var mockData: [Profile] {
        [
            .init(image: "swift", name: "Swift"),
            .init(image: "wakanda", name: "Wakanda"),
            .init(image: "super-mario-bros-movie", name: "Mario"),
        ]
    }
}

struct RadioButton: View {
    var outerDiameter: CGFloat = 24 // default value
    var innerDiameter: CGFloat = 14 // default value

    @State private var isSelected = false

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            Circle()
                .strokeBorder(.gray, lineWidth: 2)
                .background(
                    Circle()
                        .frame(width: innerDiameter, height: innerDiameter)
                        .foregroundColor(isSelected ? .blue : .clear)
                )
                .frame(width: outerDiameter, height: outerDiameter)
        }
    }
}

struct ProfileRow: View {
    let imageName: String
    let profileName: String

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Image(imageName)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(22)
                Text(profileName)
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
                Text("Your Profiles")
                    .font(.headline)
                    .padding(.top, 40)
                Divider()
                ForEach(Profile.mockData, id: \.image) { profile in
                    ProfileRow(imageName: profile.image,
                               profileName: profile.name
                    )
                }
            }
        }
    }
}

struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
        VStack {
            Button(action: {
                isPresented.toggle()
            }) {
                HStack {
                    Text("Change Profile")
                    Image(systemName: "chevron.down")
                }
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
