//
//  ContentView.swift
//  Dupe
//
//  Created by Varghese, Joshua on 26.06.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0 ..< 4) { _ in
                HStack {
                    ForEach(0 ..< 4) { _ in
                        Square()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
