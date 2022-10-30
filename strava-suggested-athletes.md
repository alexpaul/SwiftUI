# Strava "Suggested Athletes"

<img width="1453" alt="Screen Shot 2022-10-30 at 5 05 24 PM" src="https://user-images.githubusercontent.com/1819208/198901617-e5fa9364-146b-4ac1-bf15-ebd46d89d183.png">


```swift
import SwiftUI

struct Card: View {
    private enum Constants {
        static let imageSize: Double = 80
        static let cardSize: Double = 160
        static let bottomPadding: Double = 10
        static let imagePadding: Double = 8
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "xmark")
                    .foregroundColor(Color(uiColor: .systemGray))
                    .padding(.top, Constants.imagePadding)
                    .padding(.trailing, Constants.imagePadding)
                    .onTapGesture {
                        print("dismiss action")
                    }
            }
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.imageSize, height: Constants.imageSize)
                .background(Color(uiColor: .systemGray5))
                .cornerRadius(Constants.imageSize/2)
                .padding(.top, Constants.bottomPadding)
                .padding(.bottom, 4)
            Text("Alex Paul")
                .font(.headline)
                .padding(.bottom, 4)
            Text("You have mutual friends on Strava")
                .font(.caption)
                .foregroundColor(Color(uiColor: .systemGray))
                .multilineTextAlignment(.center)
                .padding(.bottom, Constants.bottomPadding)
            Button("Follow") {
                print("follow action")
            }
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.orange)
            .cornerRadius(8)
            .padding(.bottom, Constants.bottomPadding)
            .padding(.horizontal, 8)
        }
        .background(.white)
        .cornerRadius(8)
        .frame(width: Constants.cardSize)
    }
}

struct ContentView: View {

    private let rows = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(0..<20, id: \.self) { _ in
                    Card()
                }
            }
            .frame(height: 300)
            .padding(.leading, 8)
        }
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .systemGroupedBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
