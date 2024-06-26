//
//  Square.swift
//  Dupe
//
//  Created by Varghese, Joshua on 19.06.24.
//

import SwiftUI

struct Square: View {
    private let size = 50.0
    private let bounceDuration = 0.2
    private let bounceAmount = 0.2
    private let bounceModifier = 0.2

    @State private var scale = 1.0

    var body: some View {
        Button("Square") {
            onSquarePress()
        }
        .labelsHidden()
        .frame(width: size,
               height: size)
        .background(.blue)
        .clipShape(.buttonBorder)
        .scaleEffect(scale)
    }

    private func onSquarePress() {
        withAnimation(.spring(duration: bounceDuration,
                              bounce: bounceAmount))
        {
            scale += bounceModifier
        } completion: {
            withAnimation(.spring(duration: bounceDuration,
                                  bounce: bounceAmount))
            {
                scale -= bounceModifier
            }
        }
    }
}

#Preview {
    Square()
}
