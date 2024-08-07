# Applying shadows

## Example 1

<img width="1294" alt="Screenshot 2024-08-07 at 6 21 45 AM" src="https://github.com/user-attachments/assets/b783701b-84ea-4856-a5fc-5ac4a8e282f4">

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Olympics 2024")
                .font(.largeTitle)
            Text("Julien Alfred won Saint Lucia")
            HStack {
                Text("🥇")
                Text("🥈")
            }
            .font(.title)
            Text("🇱🇨")
            .font(.largeTitle)
        }
        .frame(width: 300, height: 300)
        .background(
            Color(.blackBase),
            in: .rect(cornerRadius: 4)
                .stroke(lineWidth: 1)
        )
        .background(
            Color(.whiteBase)
                .shadow(color: .blue, radius: 12, x: 0, y: 2)
        )
    }
}

#Preview {
    ContentView()
}
```

***

## Example 2

![Screenshot 2023-06-01 at 7 22 29 AM](https://github.com/alexpaul/SwiftUI/assets/1819208/804c6389-59a9-433a-aad1-fc40541c7ac1)

try? it out 

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("wakanda")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)
            Spacer()
            HStack {
                Spacer()
                Text("miles phan")
                    .font(.caption2)
                    .italic()
                    .foregroundColor(.gray)
            }
            .padding([.trailing, .bottom], 16)
        }
        .frame(height: 600)
        .frame(maxWidth: .infinity)
        .background(.white)
        .padding(.horizontal, 20)
        .shadow(color: .gray.opacity(0.5), radius: 12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
