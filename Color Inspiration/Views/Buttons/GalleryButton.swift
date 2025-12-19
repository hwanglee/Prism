//
//  GalleryButton.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/14/23.
//

import SwiftUI

struct GalleryButton: View {
    @State private var isSheetOpened = false

    var body: some View {
        Button {
            isSheetOpened = true
        } label: {
            Image(systemName: "rectangle.on.rectangle.angled")
                .font(.system(.largeTitle, weight: .light))
        }
        .tint(.primary)
        .sheet(isPresented: $isSheetOpened) {
            GalleryGrid()
        }
    }
}

#Preview {
    GalleryButton()
}
