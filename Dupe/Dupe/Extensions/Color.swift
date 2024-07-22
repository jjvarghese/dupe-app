//
//  Color.swift
//  Dupe
//
//  Created by Varghese, Joshua on 22.07.24.
//

import Foundation
import SwiftUI

extension Color {
    static let rubikBlue = Color(hex: "#0046ad")
    static let rubikGreen = Color("#009b48")
    static let rubikRed = Color("#b71234")
    static let rubikYellow = Color("#ffd500")
    static let rubikOrange = Color("#ff5800")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
            
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
            
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
            
        self.init(red: red, green: green, blue: blue)
    }
}
