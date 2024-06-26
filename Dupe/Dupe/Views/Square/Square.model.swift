//
//  Square.model.swift
//  Dupe
//
//  Created by Varghese, Joshua on 26.06.24.
//

import Foundation

private let baseScale = 1.0
private let bounceModifier = 0.2
private let maxSize = baseScale + bounceModifier

extension Square {
    @Observable
    class ViewModel {
        private(set) var scale = baseScale

        func grow() {
            scale = maxSize
        }

        func shrink() {
            scale = baseScale
        }
    }
}
