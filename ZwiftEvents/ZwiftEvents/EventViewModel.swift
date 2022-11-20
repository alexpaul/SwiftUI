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
        loadEvents()
    }

    private func loadEvents() {
        do {
            events = try Event.events().sorted { $0.route < $1.route }
        } catch {
            events = []
        }
    }
}
