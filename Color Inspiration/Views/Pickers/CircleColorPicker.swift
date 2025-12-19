//
//  CircleColorPicker.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/13/23.
//

import SwiftUI

struct CircleColorPicker: View {
    @Binding var selectedColor: Color
    
    var body: some View {
        ColorPicker("", selection: $selectedColor)
            .labelsHidden()
            .scaleEffect(3)
            .opacity(0.015)
            .overlay {
                Circle()
                    .fill(selectedColor)
                    .frame(width: 86, height: 86)
                    .allowsHitTesting(false)
                    .animation(.smooth, value: selectedColor)
            }
    }
}

#Preview {
    CircleColorPicker(selectedColor: .constant(Color.green))
}
