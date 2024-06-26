//
//  Square.model.swift
//  Dupe
//
//  Created by Varghese, Joshua on 26.06.24.
//

import Foundation

extension Square {
    @Observable
    class ViewModel {
        private let bounceModifier = 0.2

        private(set) var scale = 1.0

        func grow() {
            scale += bounceModifier
        }

        func shrink() {
            scale -= bounceModifier
        }
    }
}
