//
//  ModePicker.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/13/23.
//

import SwiftUI

struct ModePicker: View {
    @Binding var selectedMode: Mode
    
    var body: some View {
        Menu {
            Picker("Appearance", selection: $selectedMode) {
                ForEach(Mode.allCases, id: \.self) {
                    Text($0.displayName)
                }
            }
        } label: {
            Label(selectedMode.displayName, systemImage: "line.3.horizontal.decrease.circle")
                .pickerStyle()
        }
    }
}

#Preview {
    ModePicker(selectedMode: .constant(Mode.allCases.first!))
}
