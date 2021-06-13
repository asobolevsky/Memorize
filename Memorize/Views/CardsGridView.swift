//
//  CardsGridView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-09.
//

import SwiftUI

struct CardsGridView: View {
    let cards: [Card]
    var didTapCard: (Card) -> ()
    
    var body: some View {
        ScrollView {
            let gridItems = [ GridItem(.adaptive(minimum: .minCardWidth)) ]
            LazyVGrid(columns: gridItems) {
                ForEach(cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            didTapCard(card)
                        }
                }
            }
        }
    }
}

struct CardsGridView_Previews: PreviewProvider {
    static var previews: some View {
        let emojis = [ "🚌", "🚗", "🚂", "🚋", "🚊", "🚴‍♂️", "🏃‍♂️", "🚇", ]
        let cards: [Card] = zip(0..<emojis.count, emojis).map { (idx, emoji) in
            Card(id: idx, content: emoji)
        }
        CardsGridView(cards: cards, didTapCard: { _ in })
    }
}

private extension CGFloat {
    static let minCardWidth: CGFloat = 70
}
