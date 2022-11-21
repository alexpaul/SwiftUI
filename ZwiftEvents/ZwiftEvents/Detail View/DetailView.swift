//
//  DetailView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

struct DetailView: View {
    let event: Event

    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                Group {
                    HeaderView(event: event)
                    EventDescriptionView(event: event)
                    if !event.photos.isEmpty { PhotosView(event: event) }
                    ResourceLinksView(event: event)
                }
                .navigationTitle(event.route)
                .navigationBarTitleDisplayMode(.inline)
            }
            if event.title.lowercased().contains("birthday") {
                ParticlesView()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(event: Event.mockEvent())
        }
    }
}
