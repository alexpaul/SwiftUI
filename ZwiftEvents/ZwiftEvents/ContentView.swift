//
//  ContentView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

struct ContentView: View {
    private let data: [Event] = [
        Event.mockEvent(),
        Event.mockEvent(),
        Event.mockEvent(),
        Event.mockEvent(),
    ]

    private let columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width))
    ]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.id) { event in
                        NavigationLink(destination: DetailView()) {
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
