//
//  Modes.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/13/23.
//

import Foundation

enum Mode: CaseIterable {
    case monochrome
    case monochromeDark
    case monochromeLight
    case analogic
    case complement
    case analogicComplement
    case triad
    case quad
    
    var displayName: String {
        switch self {
        case .monochrome:
            "Monochrome"
        case .monochromeDark:
            "Monochrome Dark"
        case .monochromeLight:
            "Monochrome Light"
        case .analogic:
            "Analogic"
        case .complement:
            "Complement"
        case .analogicComplement:
            "Analogic Complement"
        case .triad:
            "Triad"
        case .quad:
            "Quad"
        }
    }
    
    var parameterName: String {
        switch self {
        case .monochrome:
            "monochrome"
        case .monochromeDark:
            "monochrome-dark"
        case .monochromeLight:
            "monochrome-light"
        case .analogic:
            "analogic"
        case .complement:
            "complement"
        case .analogicComplement:
            "analogic-complement"
        case .triad:
            "triad"
        case .quad:
            "quad"
        }
    }
}

