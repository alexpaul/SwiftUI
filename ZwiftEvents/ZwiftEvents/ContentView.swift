//
//  ContentView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

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

struct ContentView: View {
    private let data: [Event] = [
        Event.mockEvent(),
        Event.mockEvent(),
        Event.mockEvent(),
        Event.mockEvent(),
    ]

    private let viewModel = EventViewModel()

    private let columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width))
    ]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.events, id: \.self) { event in
                        NavigationLink(destination: DetailView(event: event)) {
                            EventRow(event: event)
                        }
                    }
                }
                .navigationTitle("Zwift Events")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
