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
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                image
                Color.zwiftOrange
                    .frame(height: 12)
            }
            Text(event.route)
                .font(.largeTitle)
                .foregroundColor(.zwiftOrange)
                .background(Color.black.opacity(0.4))
                .bold()
                .offset(y: -60)
        }
    }

    private var image: some View {
        AsyncImage(url: URL(string: event.thumbnailURL)!) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .frame(maxWidth: .infinity)
        } placeholder: {
            ProgressView()
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event.mockEvent())
    }
}
