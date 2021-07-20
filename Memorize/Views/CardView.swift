//
//  CardView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-09.
//

import SwiftUI

struct CardView: View {
    let index: Int
    let card: Card
    
    var body: some View {
        GeometryReader { geometry in
            let contentFontSize = min(geometry.size.width, geometry.size.width) * .cardContentFontSizeRatio
            ZStack {
                let shape = RoundedRectangle(cornerRadius: .cardCornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: .cardBorderWidth)
                    let circleWidth = geometry.size.width * .timeCircleWidthRatio
                    Pie(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90))
                        .frame(width: circleWidth, height: circleWidth, alignment: .center)
                        .opacity(.timeCircleTransparency)
                    Text(card.content).font(.system(size: contentFontSize))
                } else {
                    shape.fill()
                    Text("\(index + 1)")
                        .foregroundColor(.white)
                        .font(.system(size: contentFontSize))
                }
            }
            .opacity(card.isMatched ? .cardIsMatchedTransparency : 1.0)
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        let card = Card(id: 1, content: "🚂")
//        CardView(card: card)
//    }
//}

private extension CGFloat {
    static let cardCornerRadius: CGFloat = 25.0
    static let cardBorderWidth: CGFloat = 3.0
    static let cardContentFontSizeRatio: CGFloat = 0.55
    static let timeCircleWidthRatio: CGFloat = 0.85
}

private extension Double {
    static let cardIsMatchedTransparency: Double = 0.3
    static let timeCircleTransparency: Double = 0.4
}
