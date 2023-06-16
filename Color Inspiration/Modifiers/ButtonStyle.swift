//
//  ButtonStyle.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/14/23.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tint(.primary)
            .font(.callout)
            .fontDesign(.monospaced)
            .fontWeight(.light)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .frame(alignment: .center)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonStyle())
    }
}

#Preview {
    Text("Testing")
        .buttonStyle()
}
