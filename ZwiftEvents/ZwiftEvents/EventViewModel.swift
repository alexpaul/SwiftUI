//
//  EventViewModel.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import Foundation

final class EventViewModel: ObservableObject {
    @Published var events: [Event] = []

    init() {
        self.fetch()
    }

    private func fetch() {
        do {
            events = try Event.events()
        } catch {
            events = []
        }
    }
}
