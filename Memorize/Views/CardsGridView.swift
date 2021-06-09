//
//  CardsGridView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-09.
//

import SwiftUI

struct CardsGridView: View {
    var cards: [Card]
    @Binding var cardsCount: Int
    
    var body: some View {
        ScrollView {
            let gridItems = [ GridItem(.adaptive(minimum: .minCardWidth)) ]
            LazyVGrid(columns: gridItems) {
                ForEach(cards[0..<cardsCount], id: \.self) { card in
                    CardView(content: card.emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
}

struct CardsGridView_Previews: PreviewProvider {
    static let cards = [
        Card(emoji: "🚌"),
        Card(emoji: "🚗"),
        Card(emoji: "🚂"),
        Card(emoji: "🚋"),
        Card(emoji: "🚊"),
        Card(emoji: "🚴‍♂️"),
        Card(emoji: "🏃‍♂️"),
        Card(emoji: "🚇"),
    ]
    
    static var previews: some View {
        CardsGridView(cards: cards, cardsCount: .constant(4))
    }
}

private extension CGFloat {
    static let minCardWidth: CGFloat = 70
}
