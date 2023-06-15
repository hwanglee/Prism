//
//  ColorSquare.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/13/23.
//

import SwiftUI

struct ColorSquare: View {
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(color)
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    ColorSquare(color: .red)
        .frame(width: 100, height: 100)
}

