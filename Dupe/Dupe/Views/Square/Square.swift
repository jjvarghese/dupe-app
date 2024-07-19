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

    var id: Int

    @Binding var dragOffset: CGSize
    @Binding var currentSquare: Int?
    @Binding var dragPosition: CGPoint

    @State private var viewModel = ViewModel()

    var body: some View {
        Color(.blue)
            .frame(width: size,
                   height: size)
            .clipShape(.buttonBorder)
            .scaleEffect(viewModel.scale)
            .onChange(of: dragPosition) { _, newPosition in
                handleDragChange(newPosition)
            }
    }

    private func isDraggingOverSquare(_ position: CGPoint) -> Bool {
        let row = id / 4
        let column = id % 4
        let xStart = CGFloat(column) * size
        let xEnd = xStart + size
        let yStart = CGFloat(row) * size
        let yEnd = yStart + size

        return position.x > xStart && position.x < xEnd && position.y > yStart && position.y < yEnd
    }

    private func handleDragChange(_ newPosition: CGPoint) {
        if isDraggingOverSquare(newPosition) {
            if currentSquare != id {
                currentSquare = id
                onSquarePress()
            }
            dragOffset = CGSize(
                width: newPosition.x - CGFloat(id % 4) * size - size / 2,
                height: newPosition.y - CGFloat(id / 4) * size - size / 2
            )
        }
    }

    private func onSquarePress() {
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

// #Preview {
//    var dragOffsets: [Int: CGSize] = [:]
//    var currentSquare: Int?
//
//    Square(id: 0,
//           dragOffset: $dragOffsets,
//           currentSquare: $currentSquare)
// }
