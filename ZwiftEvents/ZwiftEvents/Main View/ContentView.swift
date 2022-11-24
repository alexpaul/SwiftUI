//
//  ContentView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/19/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) private var openURL

    @State private var isPresented = false

    var body: some View {
        NavigationView {
            EventList()
                .toolbar {
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "calendar")
                    }
                    .sheet(isPresented: $isPresented) {
                        WebView(url: URL(string: "https://zwiftinsider.com/schedule/")!)
                    }
                }
        }
        .accentColor(.zwiftOrange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
