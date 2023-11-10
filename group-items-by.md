# Group items by a given property 

![Screenshot 2023-11-10 at 4 23 48 PM](https://github.com/alexpaul/SwiftUI/assets/1819208/eb577304-6af2-489e-a7fa-3ff937f37a79)

try? it out 

```swift
import SwiftUI

struct Book: Hashable {
    var title = ""
    var author = ""
    var category = ""

    static var data: [Book] {
        [
            Book(
                title: "Birnam Wood",
                author: "Eleanor Catton",
                category: "Fiction"
            ),
            Book(
                title: "The Last Animal: A Novel",
                author: "Ramona Ausubel",
                category: "Fiction"
            ),
            Book(
                title: "This Other Eden",
                author: "Sarah Bryant",
                category: "Romance"
            ),
            Book(
                title: "The Wager: A Tale of Shipwreck, Mutiny and Murder",
                author: "David Grann",
                category: "History"
            ),
            Book(
                title: "Fourth Wing",
                author: "Rebecca Yarros",
                category: "Fantasy"
            ),
            Book(
                title: "The Mythmakers",
                author: "Keziah Weir",
                category: "Fiction"
            ),
            Book(
                title: "Outlive: The Science and Art of Longevity",
                author: "Peter Attia",
                category: "Health"
            ),
            Book(
                title: "Julia and the Shark",
                author: "Kiran Millwood Hargrave",
                category: "Middle Grade"
            ),
            Book(
                title: "Be the Bus: The Lost and Profound Wisdom of the Pigeon",
                author: "Mo Willems",
                category: "Picture Books"
            ),
            Book(
                title: "Harold the Iceberg Melts Down",
                author: "Lisa Wyzlic",
                category: "Picture Books"
            )
        ]
    }

    static var groupBooksByCategory: [[Book]] {
        let groupedBooks = Dictionary(grouping: data, by: { $0.category })
        let sortedCategories = groupedBooks.keys.sorted()
        let sortedBooks = sortedCategories.map { category in
            groupedBooks[category] ?? []
        }
        return sortedBooks
    }
}

struct HorizontalItemView: View {
    let items: [Book]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(items, id: \.self) { item in
                    Text(item.title)
                        .frame(width: 60, height: 100)
                        .font(.footnote)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(lineWidth: 2)
                        }
                }
            }
        }
        .frame(height: 200)
    }
}

struct ContentView: View {
    var body: some View {
        List {
            ForEach(Book.groupBooksByCategory, id: \.self) { items in
                Section(items.first?.category ?? "") {
                    HorizontalItemView(items: items)
                }
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
