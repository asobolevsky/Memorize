//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-10.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    private(set) var score: Int = 0
    
    private var indexOfFaceUpCard: Int?
    
    init(cardPairsNumber: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<cardPairsNumber {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: cardContent))
            cards.append(Card(id: pairIndex * 2 + 1, content: cardContent))
        }
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) else {
            return
        }
        
        guard (cards[chosenIndex].isFaceUp || cards[chosenIndex].isMatched) != true else {
            return
        }
        
        if let potentialMatchIndex = indexOfFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                score += 2
            } else {
                let cardsBeingMatched = cards[chosenIndex, potentialMatchIndex]
                let numberOfCardsAlreadyBeenSeen = cardsBeingMatched.filter { $0.hasBeenSeen }.count
                score -= numberOfCardsAlreadyBeenSeen
                
                cards[chosenIndex].hasBeenSeen = true
                cards[potentialMatchIndex].hasBeenSeen = true
            }
            indexOfFaceUpCard = nil
        } else {
            cards.indices
                .filter { cards[$0].isMatched == false }
                .forEach { cards[$0].isFaceUp = false }
            indexOfFaceUpCard = chosenIndex
        }
        
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var hasBeenSeen: Bool = false
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
    }
}
