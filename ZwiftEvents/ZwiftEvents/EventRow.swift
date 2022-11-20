//
//  EventRow.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

struct EventRow: View {
    let event: Event

    private let badgeSize: Double = 40

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
                .background(Color.black.opacity(0.6))
                .bold()
                .offset(y: -60)
            if event.isCompleted {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: badgeSize, height: badgeSize)
                    .foregroundColor(.zwiftOrange)
                    .offset(x: 180, y: -120)
                    .shadow(color: .black, radius: 8)
            }
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
