# Vote Inspired 

![Screen Shot 2022-11-08 at 5 01 17 PM](https://user-images.githubusercontent.com/1819208/200687009-8ffa2ae3-b840-428a-8395-c34fc04744a0.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            Image("fam-vote")
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading, spacing: 10) {
                Text("Election Day is here!")
                    .font(.largeTitle)
                    .bold()
                Text("Your voice matters. Find your polling place or ballot drop box site, voting instructions, and more.")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 20)
            Group {
                Button(action: {}) {
                    Text("Get started")
                        .frame(minHeight: 44)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .bold()
                }
                .background(.black)
                .cornerRadius(22)
                .padding(.bottom, 10)
                Button(action: {}) {
                    Text("See the most recent updates about the elections")
                        .frame(minHeight: 44)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .bold()
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(.gray, lineWidth: 1)
                        )
                }
                .background(.white)
                .cornerRadius(22)
            }
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
