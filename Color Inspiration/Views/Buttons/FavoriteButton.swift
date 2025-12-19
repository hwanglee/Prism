//
//  FavoriteButton.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/14/23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isFavorited: Bool
    
    var body: some View {
        Button {
            isFavorited.toggle()
        } label: {
            Image(systemName: isFavorited ? "heart.fill" : "heart")
                .font(.system(.largeTitle, weight: .light))
        }
        .animation(.default, value: isFavorited)
        .tint(.primary)
    }
}

#Preview {
    FavoriteButton(isFavorited: .constant(false))
}
