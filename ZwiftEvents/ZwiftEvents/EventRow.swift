//
//  EventRow.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

struct EventRow: View {
    let event: Event

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            image
            Color.orange
                .frame(height: 12)
        }
    }

    private var image: some View {
        AsyncImage(url: URL(string: event.imageURL)!) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 220)
        } placeholder: {
            ProgressView()
        }
        .padding(.bottom, 4)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event.mockEvent())
    }
}
