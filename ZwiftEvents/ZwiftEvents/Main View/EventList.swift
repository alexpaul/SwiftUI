//
//  EventList.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/21/22.
//

import SwiftUI

struct EventList: View {
    private let viewModel = EventViewModel()

    private let columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width))
    ]

    var body: some View {
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

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
