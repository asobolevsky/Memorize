//
//  CardView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-09.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: .cardCornerRadius)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: .cardBorderWidth)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .opacity(card.isMatched ? 0.3 : 1.0)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = Card(id: 1, content: "🚂")
        CardView(card: card)
    }
}

private extension CGFloat {
    static let cardCornerRadius: CGFloat = 25.0
    static let cardBorderWidth: CGFloat = 3.0
}
