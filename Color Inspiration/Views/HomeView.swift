//
//  HomeView.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/6/23.
//

import SwiftUI
import Observation

struct HomeView: View {
    static var rowCount = 4
    
    var networkService = NetworkService()
    
    @Environment(\.modelContext) private var modelContext
    @State var selectedColor = Color.random
    @State var colors: [Color] = [.clear]
    @State var count = rowCount
    @State var selectedMode = Mode.allCases.first!
    @State var scale: CGFloat = 1.0
    @State var isFavorited = false
    @State var isSheetOpened = false
    
    let columns = Array(repeating: GridItem(.flexible()), count: rowCount)
    
    var body: some View {
        VStack(spacing: 28) {
            ColorGrid(colors: colors)
                .onTapGesture(count: 2) {
                    isFavorited.toggle()
                }
                .onLongPressGesture {
                    selectedColor = .random
                }
            
            VStack(alignment: .trailing, spacing: 14) {
                ModePicker(selectedMode: $selectedMode)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                CountPicker(count: $count)
            }
            .padding(.horizontal, 14)
            
            HStack {
                GalleryButton(isSheetOpened: $isSheetOpened)
                
                CircleColorPicker(selectedColor: $selectedColor)
                    .frame(maxWidth: .infinity)
//                    .onLongPressGesture {
//                        selectedColor = .random
//                    }
                
                FavoriteButton(isFavorited: $isFavorited)
            }
            .padding(.top, 20)
            .padding(.bottom, 60)
        }
        .sheet(isPresented: $isSheetOpened) {
            GalleryGrid()
        }
        .onChange(of: selectedColor, initial: true) { _, _ in
            fetchColors()
            
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
        }
        .onChange(of: count) { _, _ in
            fetchColors()
        }
        .onChange(of: selectedMode) { _, _ in
            fetchColors()
        }
        .onChange(of: isFavorited) { _, _ in
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
            
            saveColor()
        }
    }
    
    func fetchColors() {
        Task {
            do {
                let colorInfo = try await networkService.fetchColorInfo(
                    r: Int(selectedColor.components.red * 255),
                    g: Int(selectedColor.components.green * 255),
                    b: Int(selectedColor.components.blue * 255),
                    mode: selectedMode,
                    count: count
                )
                
                colors = colorInfo.colors.map {
                    Color(red: Double($0.rgb.r) / 255, green: Double($0.rgb.g) / 255, blue: Double($0.rgb.b) / 255)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func saveColor() {
        print(selectedColor.description)
        print(selectedColor.hashValue)
        let favoritedColor = FavoriteColor(name: "\(selectedColor.description)",
                                           r: selectedColor.components.red,
                                           g: selectedColor.components.green,
                                           b: selectedColor.components.blue)
        
        if isFavorited {
            modelContext.insert(favoritedColor)
        } else {
            modelContext.delete(favoritedColor)
        }
    }
}


#Preview {
    HomeView()
}