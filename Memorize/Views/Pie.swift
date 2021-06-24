//
//  Pie.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-24.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = true
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let radius = min(rect.width, rect.height) / 2
        let center = rect.center
        let offsetStartAngle = Angle(radians: startAngle.radians - .angleOffset)
        let offsetEndAngle = Angle(radians: endAngle.radians - .angleOffset)
        let start = CGPoint(x: center.x + radius * CGFloat(cos(offsetStartAngle.radians)),
                            y: center.y + radius * CGFloat(sin(offsetStartAngle.radians)))
        
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: offsetStartAngle, endAngle: offsetEndAngle, clockwise: clockwise)
        
        return p
    }
    
}


private extension Double {
    static let angleOffset: Double = .pi / 2
}
