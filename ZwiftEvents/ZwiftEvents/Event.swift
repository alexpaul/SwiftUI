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
struct Event: Decodable, Hashable {
    let route: String
    let date: String
    let startTime: String
    let estimatedFinishTime: String
    let title: String
    let description: String
    let distance: String
    let elevation: String
    let thumbnailURL: String
    let imageURL: String
    let imageName: String
    let strava: String
    let segment: String
    let zwiftInsiderURL: String
    let power: String
    let isCompleted: Bool
    let photos: [String]
    let world: String
}

extension Event {
    enum EventError: Error {
        case noResource
        case noContents
        case jsonDecodingError(Error)
    }

    static func events() throws -> [Event] {
        guard let url = Bundle.main.url(forResource: "events", withExtension: "json") else {
            throw EventError.noResource
        }
        guard let data = try? Data(contentsOf: url) else {
            throw EventError.noContents
        }
        do {
            let root = try JSONDecoder().decode(Root.self, from: data)
            return root.events
        } catch {
            throw EventError.jsonDecodingError(error)
        }
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
            thumbnailURL: "https://preview.redd.it/ojot7r4qapc41.jpg?auto=webp&s=5b337b98734ef5141e57ba1f790d48f718f72724",
            imageURL: "https://zwiftinsider.com/wp-content/uploads/2020/05/four-horsemen-zwifthub.png",
            imageName: "fourHorsemen",
            strava: "https://www.strava.com/activities/1748727988",
            segment: "",
            zwiftInsiderURL: "https://zwiftinsider.com/route/four-horsemen/",
            power: "212 Watts",
            isCompleted: true,
            photos: [
                "https://res.cloudinary.com/dkah2peax/image/upload/v1669067254/Zwift/adz-1000-feet_ufqaoy.jpg"
            ],
            world: "Watopia"
        )
    }
}
