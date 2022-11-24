//
//  EventRow.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

struct EventRow: View {
    let event: Event

    private enum Constants {
        static let badgeSize: Double = 40
        static let shadowRadius: Double = 12
    }

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                image
                Color.zwiftOrange
                    .frame(height: 8)
            }
            Text(event.route)
                .font(.largeTitle)
                .foregroundColor(.zwiftOrange)
                .bold()
                .offset(y: -60)
                .shadow(color: .black, radius: Constants.shadowRadius)
            if event.isCompleted {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.badgeSize, height: Constants.badgeSize)
                    .foregroundColor(.zwiftOrange)
                    .offset(x: 160, y: -120)
                    .shadow(color: .black, radius: Constants.shadowRadius)
            }
        }
    }

    private var image: some View {
        Image(event.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event.mockEvent())
    }
}
