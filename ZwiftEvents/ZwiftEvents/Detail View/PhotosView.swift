//
//  PhotosView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/21/22.
//

import SwiftUI

struct PhotosView: View {
    let event: Event

    var body: some View {
        let itemSize: Double = 400
        let rows: [GridItem] = [GridItem(.fixed(itemSize))]
        let height: Double = itemSize * 0.75

        return ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(event.photos, id: \.self) { photoURL in
                    AsyncImage(url: URL(string: photoURL)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: itemSize, height: height)
                            .background(.red)
                    } placeholder: {
                        ZStack {
                            ProgressView()
                        }
                        .frame(width: itemSize, height: height)
                        .background(Color(uiColor: .systemGray3))
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .frame(maxHeight: height)
        .background(Color(uiColor: .systemGray6))
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView(event: Event.mockEvent())
    }
}
