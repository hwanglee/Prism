//
//  PickerStyle.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/14/23.
//

import SwiftUI

struct PickerStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tint(.primary)
            .font(.callout)
            .fontDesign(.monospaced)
            .fontWeight(.light)
    }
}

extension View {
    func pickerStyle() -> some View {
        modifier(PickerStyle())
    }
}

#Preview {
    Text("Testing")
        .pickerStyle()
}
