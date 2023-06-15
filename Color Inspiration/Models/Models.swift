//
//  Models.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/13/23.
//

import Foundation

// MARK: - Welcome
struct ColorInfo: Codable {
    let mode: String
    let count: String
    let colors: [Seed]
    let seed: Seed

    enum CodingKeys: String, CodingKey {
        case mode, count, colors, seed
    }
}

// MARK: - Seed
struct Seed: Codable {
    let hex: Hex
    let rgb: RGB
    let name: Name
    let contrast: Contrast

    enum CodingKeys: String, CodingKey {
        case hex, rgb, name, contrast
    }
}

// MARK: - Contrast
struct Contrast: Codable {
    let value: String
}

// MARK: - Hex
struct Hex: Codable {
    let value, clean: String
}

// MARK: - Name
struct Name: Codable {
    let value, closestNamedHex: String
    let exactMatchName: Bool
    let distance: Int

    enum CodingKeys: String, CodingKey {
        case value
        case closestNamedHex = "closest_named_hex"
        case exactMatchName = "exact_match_name"
        case distance
    }
}

// MARK: - RGB
struct RGB: Codable {
    let fraction: RGBFraction
    let r, g, b: Int
    let value: String
}

// MARK: - RGBFraction
struct RGBFraction: Codable {
    let r, g, b: Double
}

// MARK: - Schemes
struct Schemes: Codable {
    let monochrome, monochromeDark, monochromeLight, analogic: String
    let complement, analogicComplement, triad, quad: String

    enum CodingKeys: String, CodingKey {
        case monochrome
        case monochromeDark = "monochrome-dark"
        case monochromeLight = "monochrome-light"
        case analogic, complement
        case analogicComplement = "analogic-complement"
        case triad, quad
    }
}
