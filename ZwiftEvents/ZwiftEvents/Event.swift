//
//  Event.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import Foundation

struct Root: Decodable {
    let events: [Event]
}
struct Event: Decodable, Hashable, Identifiable {
    let route: String
    let date: String
    let startTime: String
    let estimatedFinishTime: String
    let title: String
    let description: String
    let distance: String
    let elevation: String
    let imageURL: String
    let stravaSegment: String
    let zwiftInsiderURL: String
    let powerTarget: String
    var id = UUID()
}

extension Event {
    static func events() -> [Event] {
        []
    }

    static func mockEvent() -> Event {
        Event(
            route: "Four Horsemen",
            date: "Tuesday, November 22",
            startTime: "5: 00 AM",
            estimatedFinishTime: "4 HRS 30 MINS",
            title: "Birthday Bike Ride 🥳 | 2022",
            description: "This is no leisure tour: be ready to work as you climb over 2000 meters in just under 90 kilometers! And be warned: hitting the Alpe after working your way over the previous climbs proves to be both a mental and physical challenge. Prepare yourself!",
            distance: "55.8 miles",
            elevation: "6927 feet",
            imageURL: "https://zwiftinsider.com/wp-content/uploads/2020/05/four-horsemen-zwifthub.png",
            stravaSegment: "https://www.strava.com/activities/1748727988",
            zwiftInsiderURL: "https://zwiftinsider.com/route/four-horsemen/",
            powerTarget: "212 Watts"
        )
    }
}
