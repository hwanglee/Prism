//
//  SettingsButton.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/15/23.
//

import SwiftUI

struct SettingsButton: View {
    @State var isSettingsPresented = false
    
    var body: some View {
        Button {
            isSettingsPresented.toggle()
        } label: {
            Label("Settings", systemImage: "gear")
                .buttonStyle()
        }
        .tint(.primary)
        .sheet(isPresented: $isSettingsPresented) {
            SettingsView()
        }
    }
}

#Preview {
    SettingsButton()
}
