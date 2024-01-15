import SwiftUI

struct Movie: Hashable {
    var title: String
    var description: String

    static var data: [Movie] {
        [
            Movie(
                title: "The Super Mario Bros. Movie",
                description: "Kids love how this animated movie delves into the world of Super Mario Bros. and all the characters they know from the Nintendo games."
            ),
            Movie(
                title: "Spider-Man: Across the Spider-Verse",
                description: "Sure, multi-verses are all the rage now, but these animated Spider-Man movies were doing them before they were cool."
            ),
        ]
    }
}

struct MoviesView: View {
    var body: some View {
        Form {
            Section("Subscription to Movies") {
                ForEach(Movie.data, id: \.self) { movie in
                    Text(movie.title)
                }
            }
        }
    }
}

#Preview {
    MoviesView()
}
