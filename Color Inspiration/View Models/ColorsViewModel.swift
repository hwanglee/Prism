//
//  ColorsViewModel.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 9/25/25.
//

import Foundation
import SwiftUI

@Observable
final class ColorsViewModel {
    var colors: [Color] = []
    var selectedMode: Mode = Mode.allCases.first!
    var selectedColor = Color.random
    var count = 4
    
    private let networkService = NetworkService()
    
    func fetchColors() async throws {
        let colorInfo = try await networkService.fetchColorInfo(
            r: Int(selectedColor.components.red * 255),
            g: Int(selectedColor.components.green * 255),
            b: Int(selectedColor.components.blue * 255),
            mode: selectedMode,
            count: count
        )
        
        colors = colorInfo.colors.map {
            Color(red: Double($0.rgb.r) / 255,
                  green: Double($0.rgb.g) / 255,
                  blue: Double($0.rgb.b) / 255
            )
        }
    }
    
    func selectNextMode() {
        selectedMode = selectedMode.next()
    }
    
    func selectPreviousMode() {
        selectedMode = selectedMode.previous()
    }
}
