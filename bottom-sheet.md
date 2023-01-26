# Bottom Sheet 

A bottom sheet using `presentationDetents`. 

![Screen Shot 2023-01-25 at 9 09 07 PM](https://user-images.githubusercontent.com/1819208/214742369-2d019134-94b8-4bbb-8cd5-92382cbba87c.png)

![Screen Shot 2023-01-25 at 9 11 27 PM](https://user-images.githubusercontent.com/1819208/214742516-3e850899-24c8-4b9e-aba0-622a5915ab6f.png)

![Screen Shot 2023-01-25 at 9 11 39 PM](https://user-images.githubusercontent.com/1819208/214742530-ef2bfe45-d58f-4155-8a28-51459f94014f.png)

try? it out

```swift
import SwiftUI

struct ContactsView: View {
    private var names: [String] = [
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
