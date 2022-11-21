//
//  ParticlesGeometryEffect.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/21/22.
//

import SwiftUI

// Resource: https://betterprogramming.pub/creating-confetti-particle-effects-using-swiftui-afda4240de6b
struct ParticlesGeometryEffect: GeometryEffect {
    var time : Double
    var speed = Double.random(in: 20 ... 200)
    var direction = Double.random(in: -Double.pi ...  Double.pi)

    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}
