//
//  ColorRecommendations.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/6/23.
//

import Foundation
import SwiftUI

struct ColorRecommendations: Decodable {
    var image: ImageLinks
}

struct ImageLinks: Decodable {
    var bare: String
    var named: String
}
