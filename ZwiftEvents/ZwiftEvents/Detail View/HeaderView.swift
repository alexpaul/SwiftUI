//
//  HeaderView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/21/22.
//

import SwiftUI

struct HeaderView: View {
    let event: Event

    var body: some View {
<<<<<<< HEAD
        VStack {
=======
        Group {
>>>>>>> main
            Text(event.title)
                .font(.title)
                .padding(.bottom, 8)
                .bold()
            Text(event.date)
                .font(.title2)
            ZStack {
                AsyncImage(url: URL(string: event.imageURL)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            }
            HStack{}
                .frame(height: 8)
                .frame(maxWidth: .infinity)
                .background(Color.zwiftOrange)
                .padding(.top, -10)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(event: Event.mockEvent())
    }
}

