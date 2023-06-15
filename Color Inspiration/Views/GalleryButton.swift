//
//  GalleryButton.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/14/23.
//

import SwiftUI

struct GalleryButton: View {
    @Binding var isSheetOpened: Bool

    var body: some View {
        Button(action: {
            isSheetOpened.toggle()
        }, label: {
            Image(systemName: "rectangle.on.rectangle.angled")
                .frame(maxWidth: .infinity)
                .font(.system(.largeTitle, weight: .light))            
        })
        .tint(.primary)
    }
}

#Preview {
    GalleryButton(isSheetOpened: .constant(false))
}
