//
//  Grid.swift
//  Dupe
//
//  Created by Varghese, Joshua on 26.06.24.
//

import SwiftUI

let SPACING = 8.0

struct Grid: View {
    @State private var dragOffsets: [Int: CGSize] = [:]
    @State private var currentSquareId: String? = nil
    @State private var dragPosition: CGPoint = .zero

    var body: some View {
        VStack(spacing: SPACING) {
            ForEach(0 ..< 4) { row in
                HStack(spacing: SPACING) {
                    ForEach(0 ..< 4) { column in
                        Square(
                            row: row,
                            column: column,
                            spacing: SPACING,
                            currentSquareId: $currentSquareId,
                            dragPosition: $dragPosition
                        )
                    }
                }
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragPosition = value.location
                }
                .onEnded { _ in
                    dragPosition = .zero
                    currentSquareId = nil
                }
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.pink)
    }
}

#Preview {
    Grid()
}
