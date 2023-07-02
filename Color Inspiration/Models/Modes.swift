//
//  Modes.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/13/23.
//

import Foundation

enum Mode: String, CaseIterable {
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

extension CaseIterable where Self: Equatable, AllCases: BidirectionalCollection {
    func previous() -> Self {
        let all = Self.allCases
        let idx = all.index(of: self)!
        let previous = all.index(before: idx)
        return all[previous < all.startIndex ? all.index(before: all.endIndex) : previous]
    }

    func next() -> Self {
        let all = Self.allCases
        let idx = all.index(of: self)!
        let next = all.index(after: idx)
        return all[next == all.endIndex ? all.startIndex : next]
    }
}
