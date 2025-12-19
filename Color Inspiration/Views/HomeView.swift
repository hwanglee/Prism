//
//  HomeView.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/6/23.
//

import SwiftUI
import Observation

struct HomeView: View {
    @State var viewModel = ColorsViewModel()
    @AppStorage("leftHandedMode") private var leftHandedMode = false
    @AppStorage("mode") private var mode = Mode.monochrome.rawValue
    @Environment(\.modelContext) private var modelContext
    @State var isFavorited = false
    
    var body: some View {
        let dragGesture = DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onEnded { value in
                print(value.translation)
                switch(value.translation.width, value.translation.height) {
                case (...0, -30...30):
                    viewModel.selectedColor = .random
                case (0..., -30...30):
                    viewModel.selectedColor = .random
                case (-100...100, ...0):
                    viewModel.selectPreviousMode()
                case (-100...100, 0...):
                    viewModel.selectNextMode()
                default:
                    print("no clue")
                }
            }
        
        VStack(spacing: 20) {
            ColorGrid(colors: viewModel.colors)
                .onTapGesture(count: 2) {
                    isFavorited.toggle()
                }
                .onLongPressGesture {
                    viewModel.selectedColor = .random
                }
                .gesture(dragGesture)
            
            VStack(alignment: .trailing, spacing: 0) {
                ModePicker(selectedMode: $viewModel.selectedMode)
                
                CountPicker(count: $viewModel.count)
                
                SettingsButton()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            HStack {
                GalleryButton()
                
                CircleColorPicker(selectedColor: $viewModel.selectedColor)
                    .frame(maxWidth: .infinity)
                
                FavoriteButton(isFavorited: $isFavorited)
            }
            .padding(.top, 14)
            .padding(.bottom, 40)
            .padding(.horizontal, 40)
        }
        .onChange(of: viewModel.selectedColor, initial: true) { _, _ in
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
            
            Task {
                try? await viewModel.fetchColors()
            }
        }
        .onChange(of: viewModel.count) { _, _ in
            Task {
                try? await viewModel.fetchColors()
            }
        }
        .onChange(of: viewModel.selectedMode) { _, _ in
            Task {
                try? await viewModel.fetchColors()
            }
        }
        .onChange(of: isFavorited) { _, _ in
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
            
            saveColor()
        }
        .task {
            viewModel.selectedMode = Mode(rawValue: mode) ?? .monochrome
        }
        .environment(\.layoutDirection, leftHandedMode ? .rightToLeft : .leftToRight)
    }
    
    func saveColor() {
        let selectedColor = viewModel.selectedColor
        let favoritedColor = FavoriteColor(name: "\(selectedColor.description)",
                                           r: selectedColor.components.red,
                                           g: selectedColor.components.green,
                                           b: selectedColor.components.blue)
        
        if isFavorited {
            modelContext.insert(favoritedColor)
        } else {
            modelContext.delete(favoritedColor)
        }
        
        do {
            try modelContext.save()
            print("SAVED")
        } catch {
            print(error)
        }
    }
}


#Preview {
    HomeView()
}
