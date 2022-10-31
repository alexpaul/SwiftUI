# Strava "Suggested Athletes"

Used here is a SwiftUI `ScrollView` along with a `LazyHGrid` to render a series of horizontal `Card`s. 

<img width="1466" alt="Screen Shot 2022-10-31 at 12 34 02 PM" src="https://user-images.githubusercontent.com/1819208/199060549-2b2cdf48-5330-4e32-97ff-f299a9d5cbe4.png">

try? it out

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
        VStack {
            HStack {
                Text("Suggested Athletes")
                    .font(.headline)
                Spacer()
                Text("See All")
                    .font(.footnote)
                    .foregroundColor(.orange)
                    .padding(.trailing, 8)
            }
            .padding(.top, 8)
            .padding(.leading, 8)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(0..<20, id: \.self) { _ in
                        Card()
                    }
                }
                .padding(.leading, 8)
            }
            .frame(height: 300)
        }
        .background(Color(uiColor: .systemGroupedBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
