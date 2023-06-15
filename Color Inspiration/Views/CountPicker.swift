//
//  CountPicker.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/14/23.
//

import SwiftUI

struct CountPicker: View {
    @Binding var count: Int
    
    var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        return formatter
    }()
    
    var body: some View {
        Menu {
            Picker("Appearance", selection: $count) {
                ForEach(3...5, id: \.self) {
                    Text(formatNumber($0))
                }
            }
        } label: {
            Label(formatNumber(count), systemImage: "rectangle.stack")
                .buttonStyle()
        }
    }
    
    func formatNumber(_ number: Int) -> String {
        let spelledOutNumber = formatter.string(from: NSNumber(value: number)) ?? ""
        
        return spelledOutNumber.capitalized.replacingOccurrences(of: "-", with: " ")
    }
}

#Preview {
    CountPicker(count: .constant(2))
}
