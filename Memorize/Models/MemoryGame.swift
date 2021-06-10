//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-10.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    init(cardPairsNumber: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<cardPairsNumber {
            let cardContent = createCardContent(pairIndex)
            let card = Card(content: cardContent)
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle()
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
    }
}
