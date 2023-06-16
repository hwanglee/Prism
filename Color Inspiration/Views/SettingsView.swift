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
    
    @State var selectedMode = Mode.monochrome
    
    var body: some View {
        NavigationView {
            let _ = print(mode)
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
                            leftHandedMode.toggle()
                        }
                    }
                }
                .fontDesign(.monospaced)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Settings")
                            .fontDesign(.monospaced)
                            .padding(.top, 20)
                    }
                }
            }
        }
        .onChange(of: selectedMode) { _, _ in
            print(selectedMode.rawValue)
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
