//
//  ParticlesView.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/21/22.
//

import SwiftUI

struct ParticlesView: View {
    private let diameter: Double = 80

    var body: some View {
        ZStack {
            Image(systemName: "balloon.2.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: diameter, height: diameter)
                .modifier(ParticlesModifier())
                .foregroundColor(.zwiftOrange)
                .offset(x: -100, y : -50)
            Image(systemName: "balloon.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: diameter, height: diameter)
                .modifier(ParticlesModifier())
                .foregroundColor(.zwiftBlue)
                .offset(x: 60, y : 70)
        }
    }
}

struct ParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ParticlesView()
    }
}
