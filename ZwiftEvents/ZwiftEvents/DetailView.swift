//
//  DetailView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.openURL) private var openURL

    private var event = Event.mockEvent()

    var body: some View {
        ScrollView {
            Group {
                header
                eventDescription
                resourceLinks
            }
            .navigationTitle(event.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var header: some View {
        Group {
            Text(event.date)
            ZStack {
                Image("fourHorsemen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, -8)
                Text(event.route)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: -60, y: -100)
            }
            HStack{}
                .frame(height: 8)
                .frame(maxWidth: .infinity)
                .background(.orange)
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
                Text("POWER TARGET")
                    .font(.headline)
                    .bold()
                Spacer()
                Text(event.powerTarget)
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
            .padding(.bottom, 20)
        }
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
            .padding(.bottom, 20)
            HStack {
                Text("Strava Segment")
                    .onTapGesture {
                        openURL(URL(string: event.stravaSegment)!)
                    }
                Text("|")
                    .foregroundColor(Color(uiColor: .systemGray3))
                Text("Zwift Insider")
                    .onTapGesture {
                        openURL(URL(string: event.zwiftInsiderURL)!)
                    }
            }
            .foregroundColor(.orange)
            .padding(.bottom, 20)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView()
        }
    }
}