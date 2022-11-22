//
//  ResourceLinksView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/21/22.
//

import SwiftUI

struct ResourceLinksView: View {
    let event: Event

    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack {
            HStack {
                Text("RESOURCE LINKS")
                    .font(.headline)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            HStack {
                if !event.strava.isEmpty {
                    Text("STRAVA")
                        .onTapGesture {
                            openURL(URL(string: event.strava)!)
                        }
                    Text("|")
                        .foregroundColor(Color(uiColor: .systemGray3))
                }
                Text("ZWIFT INSIDER")
                    .onTapGesture {
                        openURL(URL(string: event.zwiftInsiderURL)!)
                    }
                if !event.segment.isEmpty {
                    Text("|")
                        .foregroundColor(Color(uiColor: .systemGray3))
                    Text("SEGMENT")
                        .onTapGesture {
                            openURL(URL(string: event.segment)!)
                        }
                }
            }
            .bold()
            .foregroundColor(.zwiftOrange)
            .padding(.bottom, 20)
        }
    }
}

struct ResourceLinksView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceLinksView(event: Event.mockEvent())
    }
}
