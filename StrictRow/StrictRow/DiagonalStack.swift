//
//  DiagonalStack.swift
//  StrictRow
//
//  Created by Irlan Abushakhmanov on 15.03.2024.
//

import SwiftUI

struct RadialLayout: Layout {
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        guard !subviews.isEmpty else { return }
        guard subviews.count > 1 else {
            handleOnlyOne(view: subviews[0], in: bounds)
            return
        }

        let side = bounds.height / CGFloat(subviews.count)
        let size = ProposedViewSize(width: side, height: side)
        let shiftX = (bounds.width - side) / CGFloat(subviews.count - 1)

        for (index, view) in subviews.enumerated() {
            let index = CGFloat(index)
            view.place(
                at: CGPoint(
                    x: bounds.minX + shiftX * index, 
                    y: bounds.maxY - (side * (index + 1))),
                proposal: size
            )
        }
    }

    func handleOnlyOne(view: LayoutSubview, in bounds: CGRect) {
        let side = bounds.width
        let size = ProposedViewSize(width: side, height: side)
        view.place(at: CGPoint(x: bounds.minX, y: bounds.midY - side / 2), proposal: size)
    }
}
