//
//  RaceGroup.swift
//  ZwiftEvents
//
//  Created by Alex Paul on 11/21/22.
//

import SwiftUI

struct RaceGroup: Hashable {
    let color: Color
    let group: String

    static let allGroups: [RaceGroup] = [
        .init(color: .red, group: "A"),
        .init(color: .green, group: "B"),
        .init(color: .blue, group: "C"),
        .init(color: .yellow, group: "D"),
        .init(color: .purple, group: "E")
    ]
}
