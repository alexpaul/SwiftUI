# Timeline Topics 

![Screen Shot 2022-11-01 at 10 48 37 AM](https://user-images.githubusercontent.com/1819208/199262345-be6e7112-e783-4222-9888-a1872ea65a78.png)


try? it out 

```swift
import SwiftUI

struct TopicsHeader: View {
    var body: some View {
        HStack {
            Text("Expand your timeline with Topics")
                .font(.headline)
            Spacer()
        }
        .padding(.leading, 10)
        .padding(.bottom, 4)
        HStack {
            Text("You'll see top Tweets about these right in your Home timeline")
                .font(.subheadline)
            Spacer()
        }
        .padding(.leading, 10)
        .padding(.bottom, 40)
    }
}

struct Topic: View {
    let topic: String

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Text(topic)
            Image(systemName: "plus")
                .foregroundColor(.blue)
                .onTapGesture {
                    print("Add \(topic) to timeline")
                }
            Text("|")
                .foregroundColor(.gray)
            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .onTapGesture {
                    print("Disregard \(topic) from timeline")
                }
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, 20)
        .background(.white)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color(uiColor: .systemGray4), lineWidth: 1)
        )
    }
}

struct TopicList: View {
    private enum Constants {
        static let rowSize: Double = 50
        static let rowSpacing: Double = 10
    }

    private let rows = [GridItem(.fixed(Constants.rowSize), spacing: Constants.rowSpacing),
                        GridItem(.fixed(Constants.rowSize), spacing: Constants.rowSpacing),
                        GridItem(.fixed(Constants.rowSize), spacing: Constants.rowSpacing),
                        GridItem(.fixed(Constants.rowSize), spacing: Constants.rowSpacing),
                        GridItem(.fixed(Constants.rowSize), spacing: Constants.rowSpacing)
    ]

    private let data = [
        "Track & field", "Technology", "Tech news", "Computer programming",
        "Apple", "Business news", "Entertainment", "COVID-19", "Game development",
        "Triathlon", "Tech personalities", "Basketball", "NBA", "Music",
        "Science news", "Automotive", "Inspirational quotes", "Psychology",
        "Health & wellness books", "History", "Astrology", "Comedy", "Movies",
        "Black Lives Matter", "Rap", "Anime", "Books", "Education", "Harry Potter",
        "Web development", "Mathematics", "Food", "NCAA Men's Basketball", "Non-fiction",
        "Cloud computing", "Marine life", "Arts & crafts", "Formula 1", "Fitness",
        "Aviation", "Online education", "Animal crossing", "Running", "Yoga",
        "Celebrities", "Environmentalism", "Information security", "Cooking", "Nature",
        "Biology", "Massachusetts Institute of Technology", "Investing", "Nintendo",
        "Venture capital", "Sci-fi & fantasy films", "COVID-19: health experts"
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(data, id: \.self) { topic in
                    Topic(topic: topic)
                }
            }
            .frame(maxHeight: 300)
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TopicsHeader()
            TopicList()
    }
    .frame(maxHeight: 500)
    .background(Color(uiColor: .systemGroupedBackground))}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
