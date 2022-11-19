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
        Event.mockEvent()
    ]
    var body: some View {
        NavigationView {
            List(data, id: \.self) { event in
                NavigationLink(destination: DetailView()) {
                    EventRow(event: event)
                }
            }
            .navigationTitle("Zwift Events")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
