//
//  RowState.swift
//  StrictRow
//
//  Created by Irlan Abushakhmanov on 15.03.2024.
//

import SwiftUI

enum RowState {
    case horizontal
    case diagonal

    mutating func toggle() {
        switch self {
            case .diagonal: self = .horizontal
            case .horizontal: self = .diagonal
        }
    }

    var layout: AnyLayout {
        let rawLayout: any Layout = {
            switch self {
                case .diagonal: return RadialLayout()
                case .horizontal: return HStackLayout(spacing: 10)
            }
        }()

        return AnyLayout(rawLayout)
    }
}
