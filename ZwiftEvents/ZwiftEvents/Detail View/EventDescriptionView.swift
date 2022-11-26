//
//  EventDescriptionView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/21/22.
//

import SwiftUI

struct EventDescriptionView: View {
    let event: Event
    let diameter: Double = 20

    var body: some View {
        VStack {
            HStack {
                Text(event.elevation)
                Spacer()
                Text(event.distance)
            }
            .font(.headline)
            .bold()
            .padding(.horizontal, 20)
            Divider()
            HStack {
                Text(event.startTime)
                    .font(.headline)
                    .bold()
                Spacer()
                Text(event.title)
            }
            .padding(.horizontal, 20)
            Divider()
            HStack {
                Text(event.estimatedFinishTime)
                    .font(.headline)
                    .bold()
                Spacer()
                HStack(alignment: .center, spacing: 2) {
                    ForEach(RaceGroup.allGroups, id:\.self) { item in
                        ZStack {
                            Circle()
                                .frame(width: diameter, height: diameter)
                                .foregroundColor(item.color)
                            Text(item.group)
                                .font(.caption)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            Divider()
            HStack {
                Text("POWER")
                    .font(.headline)
                    .bold()
                Spacer()
                Text(event.power)
            }
            .padding(.horizontal, 20)
            Divider()

            HStack {
                Text("EVENT DESCRIPTION")
                    .font(.headline)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            VStack(alignment: .leading, spacing: 20) {
                Text(event.description)
            }
            .padding(.horizontal, 20)
            .font(.footnote)
        }
    }
}

struct EventDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        EventDescriptionView(event: Event.mockEvent())
    }
}
