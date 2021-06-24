//
//  CGRect+Additions.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-24.
//

import CoreGraphics

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
