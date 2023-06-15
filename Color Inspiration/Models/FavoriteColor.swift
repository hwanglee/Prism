//
//  FavoriteColor.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/14/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class FavoriteColor {
    @Attribute(.unique) var name: String
    var r: Double
    var g: Double
    var b: Double
    var timestamp: Date
    
    init(name: String, r: Double, g: Double, b: Double) {
        self.name = name
        self.r = r
        self.g = g
        self.b = b
        self.timestamp = .now
    }
}
