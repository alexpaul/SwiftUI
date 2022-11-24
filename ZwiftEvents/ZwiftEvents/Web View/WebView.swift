//
//  WebView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/24/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    private var request: URLRequest {
        URLRequest(url: url)
    }

    func makeUIView(context: Context) -> some WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Current outstanding issue with Xcode 14
        // https://developer.apple.com/forums/thread/712074
        // Warning:
        // This method should not be called on the main thread as it may lead to UI unresponsiveness.
        uiView.load(request)
    }
}

