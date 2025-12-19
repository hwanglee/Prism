//
//  NetworkService.swift
//  Color Inspiration
//
//  Created by Hwang Lee on 6/6/23.
//

import Foundation

class NetworkService {
    func fetchColorInfo(r: Int, g: Int, b: Int, mode: Mode, count: Int = 5) async throws -> ColorInfo {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.thecolorapi.com"
        components.path = "/scheme"
        components.queryItems = [
            URLQueryItem(name: "rgb", value: "\(r),\(g),\(b)"),
            URLQueryItem(name: "mode", value: mode.parameterName),
            URLQueryItem(name: "count", value: "\(count)")
        ]
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let colorInfo = try JSONDecoder().decode(ColorInfo.self, from: data)
        
        return colorInfo
    }
}

extension NetworkService {
    enum NetworkError: Error {
        // Throw when the URL is invalid
        case invalidURL
    }
}
