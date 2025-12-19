//
//  ColorGrid.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/14/23.
//

import SwiftUI

struct ColorGrid: View {
    public var colors: [Color]
    
    private let columns: [GridItem] = [
        GridItem(.flexible())
    ]
    
    init(colors: [Color]) {
        self.colors = colors
    }
    
    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(
                columns: columns,
                spacing: 0
            ) {
                ForEach(colors, id: \.self) { color in
                    color
                        .frame(height: geometry.size.height / CGFloat(colors.count))
                }
            }
            .animation(.smooth, value: colors)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ColorGrid(colors: [.random, .random, .random])
}
