//
//  ContentView.swift
//  Dupe
//
//  Created by Varghese, Joshua on 26.06.24.
//

import SwiftUI

struct ContentView: View {
    @State private var dragOffsets: [Int: CGSize] = [:]
    @State private var currentSquare: Int? = nil
    @State private var dragPosition: CGPoint = .zero

    var body: some View {
        VStack {
            ForEach(0 ..< 4) { row in
                HStack {
                    ForEach(0 ..< 4) { column in
                        Square(
                            id: column + row * 4,
                            dragOffset: Binding(
                                get: { self.dragOffsets[column + row * 4, default: .zero] },
                                set: { self.dragOffsets[column + row * 4] = $0 }
                            ),
                            currentSquare: $currentSquare,
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
                    currentSquare = nil
                }
        )
        .padding()
    }
}

#Preview {
    ContentView()
}
