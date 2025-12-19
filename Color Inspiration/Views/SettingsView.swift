//
//  SettingsView.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/15/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("leftHandedMode") private var leftHandedMode = false
    @AppStorage("mode") private var mode = Mode.monochrome.rawValue
    
    @State private var selectedMode = Mode.monochrome
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section("Defaults") {
                    Menu {
                        Picker(selection: $selectedMode) {
                            ForEach(Mode.allCases, id: \.self) { value in
                                Text(value.displayName)
                                    .tag(value)
                                    .font(.largeTitle)
                            }
                        } label: {}
                    } label: {
                        HStack {
                            Text("Mode")
                            
                            Spacer()
                            
                            Text(selectedMode.displayName)
                        }
                    }
                    .tint(.primary)
                    
                    HStack {
                        Text("Left Layout")
                        
                        Spacer()
                        
                        Group {
                            Text(leftHandedMode ? "On" : "Off")
                            Image(systemName: leftHandedMode ? "circle.fill" : "circle")
                        }
                        .background(.clear)
                        .onTapGesture {
                            withAnimation {
                                leftHandedMode.toggle()
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Close")
                    }
                }
            }
        }
        .fontDesign(.monospaced)
        .onChange(of: selectedMode) { _, _ in
            mode = selectedMode.rawValue
        }
        .task {
            selectedMode = Mode(rawValue: mode) ?? Mode.monochrome
        }
    }
}

#Preview {
    SettingsView()
}
