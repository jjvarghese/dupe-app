//
//  Square.swift
//  Dupe
//
//  Created by Varghese, Joshua on 19.06.24.
//

import SwiftUI

private let baseScale = 1.0
private let bounceModifier = 0.2
private let maxSize = baseScale + bounceModifier
private let size = 50.0
private let bounceDuration = 0.2
private let bounceAmount = 0.2


struct Square: View {
    var squareId: String = UUID().uuidString
    var row: Int
    var column: Int
    var spacing: CGFloat

    @Binding var currentSquareId: String?
    @Binding var dragPosition: CGPoint

    @State private var scale = baseScale
    @State private var color: Color = .rubikBlue
    
    private let cornerRadius: CGFloat = 8.0
    
    var body: some View {
        Color(color)
            .frame(width: size,
                   height: size)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.black, lineWidth: 5)
            )
            .scaleEffect(scale)
            .onChange(of: dragPosition) { _, newPosition in
                handleDragChange(newPosition)
            }
    }

    // MARK: - Animations -

    private func grow() {
        scale = maxSize
        color = .white
    }

    private func shrink() {
        scale = baseScale
        color = .rubikBlue
    }

    // MARK: - Drag Calculation -

    private func onSquareDragOver() {
        withAnimation(.spring(duration: bounceDuration,
                              bounce: bounceAmount))
        {
            grow()
        } completion: {
            withAnimation(.spring(duration: bounceDuration,
                                  bounce: bounceAmount))
            {
                shrink()
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
        let area = size + spacing
        let xStart = CGFloat(column) * area
        let xEnd = xStart + area
        let yStart = CGFloat(row) * area
        let yEnd = yStart + area

        return position.x > xStart && position.x < xEnd && position.y > yStart && position.y < yEnd
    }
}

// MARK: - Preview -

struct Square_Previews: PreviewProvider {
    @State private static var dragOffset: CGSize = .zero
    @State private static var currentSquareId: String? = nil
    @State private static var dragPosition: CGPoint = .zero

    static var previews: some View {
        Square(
            row: 0,
            column: 0,
            spacing: 5.0,
            currentSquareId: $currentSquareId,
            dragPosition: $dragPosition
        )
    }
}
