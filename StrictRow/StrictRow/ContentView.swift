//
//  ContentView.swift
//  StrictRow
//
//  Created by Irlan Abushakhmanov on 15.03.2024.
//

import SwiftUI

struct ContentView: View {
    // Change this value
    private let rowsCounter = 7
    @State private var state = RowState.horizontal

    var body: some View {
        state.layout {
            ForEach(0..<rowsCounter, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
                    .aspectRatio(contentMode: .fit)
            }
        }
        .onTapGesture {
            withAnimation {
                state.toggle()
            }
        }
        .ignoresSafeArea(edges: .horizontal)
    }
}

#Preview {
    ContentView()
}
