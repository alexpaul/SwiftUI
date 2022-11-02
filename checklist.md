# Checklist 

![Screen Shot 2022-11-02 at 7 18 28 AM](https://user-images.githubusercontent.com/1819208/199476695-08cdb51b-bf4f-4ff0-85aa-84a7f04390b7.png)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    private let data = [
        "Prevent running injuries 💪🏾",
        "Improve speed and endurance 🥇",
        "Develop proper running form 🏃🏾‍♂️"
    ]

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Don't forget your plan!")
                .font(.title)
                .bold()
                .padding(.bottom, 20)
            ForEach(data, id: \.self) { item in
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: "checkmark")
                        .font(.headline)
                    Text(item)
                    Spacer()
                }
                .padding(.leading, 20)
            }
            Button(action: {}) {
                Text("YES! SEND ME THE WORKOUTS")
                    .frame(minHeight: 48)
                    .frame(maxWidth: .infinity)
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
            }
            .background(.red)
            .cornerRadius(4)
            .padding(.top, 20)
            .padding(.horizontal, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
