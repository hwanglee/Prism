//
//  Color+Random.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/6/23.
//

import Foundation
import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
