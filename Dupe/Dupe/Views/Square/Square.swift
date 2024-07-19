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

    var squareId: String = UUID().uuidString
    var row: Int
    var column: Int

    @Binding var currentSquareId: String?
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

    private func onSquareDragOver() {
        print("col", column)
        print("row", row)
        print("**")

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
    
    private func handleDragChange(_ newPosition: CGPoint) {
        if isDraggingOverSquare(newPosition) {
            if currentSquareId != squareId {
                currentSquareId = squareId
                onSquareDragOver()
            }
        }
    }

    private func isDraggingOverSquare(_ position: CGPoint) -> Bool {
        let xStart = CGFloat(column) * size
        let xEnd = xStart + size
        let yStart = CGFloat(row) * size
        let yEnd = yStart + size

        return position.x > xStart && position.x < xEnd && position.y > yStart && position.y < yEnd
    }
}

struct Square_Previews: PreviewProvider {
    @State private static var dragOffset: CGSize = .zero
    @State private static var currentSquareId: String? = nil
    @State private static var dragPosition: CGPoint = .zero

    static var previews: some View {
        Square(
            row: 0,
            column: 0,
            currentSquareId: $currentSquareId,
            dragPosition: $dragPosition
        )
    }
}
