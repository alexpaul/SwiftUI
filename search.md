# Search 

![Screen Shot 2022-11-10 at 6 57 20 AM](https://user-images.githubusercontent.com/1819208/201084711-6550db6c-4a92-4051-ae43-22ca955081b1.png)


try? it out

```swift
import SwiftUI

struct Numbers: View {
    let data: [String]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(data, id:\.self) { item in
                HStack {
                    Text(item.description)
                }
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .background(.teal)
                .padding(.bottom, 2)
            }
        }
    }
}

struct ContentView: View {
    @State private var searchText = ""

    private var data = [
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
    ].sorted { $0 < $1 }

    @State private var filteredData = [String]()

    var body: some View {
        NavigationView {
            VStack {
                Numbers(data: searchText.isEmpty ? data : filteredData)
                    .searchable(text: $searchText)
                    .onSubmit(of: .search) {
                        filteredData = data.filter {
                            $0.lowercased().contains(searchText.lowercased())
                        }
                    }
                Text("alexpaul.dev ©")
                    .padding(.vertical, 10)
            }
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

## Resources 

* [Apple docs: Adding Search to you app](https://developer.apple.com/documentation/swiftui/adding-search-to-your-app)
