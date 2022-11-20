//
//  ContentView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

struct ContentView: View {
    private let viewModel = EventViewModel()

    private let columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width))
    ]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(viewModel.events, id: \.self) { event in
                        NavigationLink(destination: DetailView(event: event)) {
                            EventRow(event: event)
                        }
                    }
                }
                .navigationTitle("Zwift Routes")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
