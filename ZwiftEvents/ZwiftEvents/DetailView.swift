//
//  DetailView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

struct DetailView: View {
    @Environment(\.openURL) private var openURL

    let event: Event

    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                Group {
                    header
                    eventDescription
                    if !event.photos.isEmpty { photos }
                    resourceLinks
                }
                .navigationTitle(event.route)
                .navigationBarTitleDisplayMode(.inline)
            }
            if event.title.lowercased().contains("birthday") {
                ParticlesView()
            }
        }
    }

    private var header: some View {
        Group {
            Text(event.title)
                .font(.title)
                .padding(.bottom, 8)
                .bold()
            Text(event.date)
                .font(.title2)
            ZStack {
                AsyncImage(url: URL(string: event.imageURL)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            }
            HStack{}
                .frame(height: 8)
                .frame(maxWidth: .infinity)
                .background(Color.zwiftOrange)
                .padding(.top, -10)
        }
    }

    struct RaceGroup: Hashable {
        let color: Color
        let group: String

        static let allGroups: [RaceGroup] = [
            .init(color: .red, group: "A"),
            .init(color: .green, group: "B"),
            .init(color: .blue, group: "C"),
            .init(color: .yellow, group: "D"),
            .init(color: .purple, group: "E")
        ]
    }

    private var eventDescription: some View {
        let diameter: Double = 20
        return Group {
            HStack {
                Text(event.startTime)
                    .font(.headline)
                    .bold()
                Spacer()
                Text(event.title)
            }
            .padding(.horizontal, 20)
            Divider()
            HStack {
                Text(event.estimatedFinishTime)
                    .font(.headline)
                    .bold()
                Spacer()
                HStack(alignment: .center, spacing: 2) {
                    ForEach(RaceGroup.allGroups, id:\.self) { item in
                        ZStack {
                            Circle()
                                .frame(width: diameter, height: diameter)
                                .foregroundColor(item.color)
                            Text(item.group)
                                .font(.caption)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            Divider()
            HStack {
                Text("POWER")
                    .font(.headline)
                    .bold()
                Spacer()
                Text(event.power)
            }
            .padding(.horizontal, 20)
            Divider()

            HStack {
                Text("EVENT DESCRIPTION")
                    .font(.headline)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            VStack(alignment: .leading, spacing: 20) {
                Text(event.description)
                Text("Elevation: \(event.elevation)")
                Text("Distance: \(event.distance)")
            }
            .padding(.horizontal, 20)
            .font(.footnote)
        }
    }

    private var photos: some View {
        let itemSize: Double = 400
        let rows: [GridItem] = [GridItem(.fixed(itemSize))]
        return ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(event.photos, id: \.self) { photoURL in
                    AsyncImage(url: URL(string: photoURL)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: itemSize, height: itemSize * 0.75)
                            .background(.red)
                    } placeholder: {
                        ZStack {
                            ProgressView()
                        }
                        .frame(width: itemSize, height: itemSize * 0.75)
                        .background(Color(uiColor: .systemGray3))
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .background(Color(uiColor: .systemGray6))
    }

    private var resourceLinks: some View {
        Group {
            HStack {
                Text("RESOURCE LINKS")
                    .font(.headline)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            HStack {
                if !event.strava.isEmpty {
                    Text("STRAVA")
                        .onTapGesture {
                            openURL(URL(string: event.strava)!)
                        }
                    Text("|")
                        .foregroundColor(Color(uiColor: .systemGray3))
                }
                Text("ZWIFT INSIDER")
                    .onTapGesture {
                        openURL(URL(string: event.zwiftInsiderURL)!)
                    }
                if !event.segment.isEmpty {
                    Text("|")
                        .foregroundColor(Color(uiColor: .systemGray3))
                    Text("SEGMENT")
                        .onTapGesture {
                            openURL(URL(string: event.segment)!)
                        }
                }
            }
            .bold()
            .foregroundColor(.zwiftOrange)
            .padding(.bottom, 20)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(event: Event.mockEvent())
        }
    }
}
