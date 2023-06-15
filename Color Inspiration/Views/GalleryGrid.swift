//
//  GalleryGrid.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/14/23.
//

import SwiftUI
import SwiftData

struct GalleryGrid: View {
    @Query(sort: \FavoriteColor.timestamp, order: .forward, animation: .smooth) var favoriteColors: [FavoriteColor]
    
    var body: some View {
        let colors = favoriteColors.map { Color(red: $0.r, green: $0.g, blue: $0.b) }
        
        ForEach(colors, id: \.self) { color in
            color
        }
        .overlay {
            if favoriteColors.isEmpty {
                /// In case there aren't any search results, we can
                /// show the new content unavailable view.
                ContentUnavailableView.init("No Favorites", systemImage: "heart")
            }
        }
    }
}

#Preview {
    GalleryGrid()
}

