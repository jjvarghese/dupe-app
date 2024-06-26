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

    @State private var viewModel = ViewModel()

    var body: some View {
        Color(.blue)
            .frame(width: size,
                   height: size)
            .clipShape(.buttonBorder)
            .scaleEffect(viewModel.scale)
            .gesture(
                DragGesture()
                    .onChanged { _ in onSquarePress() }
            )
    }

    private func onSquarePress() {
        print("onSquarePress")
        withAnimation(.spring(duration: bounceDuration,
                              bounce: bounceAmount))
        {
            viewModel.grow()
        } completion: {
            withAnimation(.spring(duration: bounceDuration,
                                  bounce: bounceAmount))
            {
                viewModel.shrink()
            }
        }
    }
}

#Preview {
    Square()
}
