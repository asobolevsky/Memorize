//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-10.
//

import Foundation

let kMinSetSize = 2
let kMaxSetSize = 3

struct MemoryGame<CardContent: Equatable> {
    var gameCards: [Card] = []
    private(set) var score = 0
    
    private var contentDeck: [CardContent] = []
    private var nextSetIndex = 0
    private let setSize: Int
    private var faceDownAllCards = false
    
    private var indicesOfFaceUpCards: [Int] {
        get {
            return gameCards.indices
                .filter { gameCards[$0].isFaceUp && (gameCards[$0].isMatched == false) }
        }
        set {
            gameCards.indices
                .filter { gameCards[$0].isMatched == false }
                .forEach { gameCards[$0].isFaceUp = newValue.contains($0) }
        }
    }
    
    private var indicesOfMatchedCards: [Int] {
        return gameCards.indices
            .filter { gameCards[$0].isMatched }
    }
    
    init(setSize: Int, numberOfSets: Int, deckSize: Int, createCardContent: (Int) -> CardContent) {
        self.setSize = max(min(setSize, kMaxSetSize), kMinSetSize)
        
        // Make deck
        for index in 0..<deckSize {
            let cardContent = createCardContent(index)
            contentDeck.append(cardContent)
        }
        
        // Update cards
        for setIndex in nextSetIndex..<(numberOfSets + nextSetIndex) {
            let cardContent = contentDeck[setIndex]
            
            for itemIndex in 0..<setSize {
                let cardId = setIndex * setSize + (setSize - itemIndex - 1)
                gameCards.append(Card(id: cardId, content: cardContent))
            }
        }
        nextSetIndex = nextSetIndex + numberOfSets
        gameCards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        guard var chosenIndex = gameCards.firstIndex(where: { $0.id == card.id }) else {
            return
        }
        
        guard gameCards[chosenIndex].isMatched == false else {
            return
        }
        
        guard gameCards[chosenIndex].isFaceUp == false else {
            deselectCardIfPossible(at: chosenIndex)
            return
        }
        
        if faceDownAllCards {
            indicesOfFaceUpCards = []
        }
        
        if replaceMatchedCardsIfPossible(), let newChosenIndex = gameCards.firstIndex(where: { $0.id == card.id }) {
            chosenIndex = newChosenIndex
        }
        indicesOfFaceUpCards.append(chosenIndex)
        if indicesOfFaceUpCards.count == setSize {
            if cardsHaveSameContent(with: indicesOfFaceUpCards) {
                addScoreAndMarkCardsAsMatched(with: indicesOfFaceUpCards)
            } else {
                subtractScoreAndMarkCardsAsSeen(with: indicesOfFaceUpCards)
            }
        } else {
            faceDownAllCards = false
        }
    }
    
    private func cardsHaveSameContent(with indices: [Int]) -> Bool {
        guard let testCardIndex = indices.first else {
            return true
        }
        let content = gameCards[testCardIndex].content
        for index in indices[1...] {
            if content != gameCards[index].content {
                return false
            }
        }
        return true
    }
    
    private mutating func subtractScoreAndMarkCardsAsSeen(with indices: [Int]) {
        let cardsBeingMatched = gameCards[indices]
        let numberOfCardsAlreadyBeenSeen = cardsBeingMatched.filter { $0.hasBeenSeen }.count
        score -= numberOfCardsAlreadyBeenSeen
        indices.forEach {
            gameCards[$0].hasBeenSeen = true
        }
        faceDownAllCards = true
    }
    
    private mutating func addScoreAndMarkCardsAsMatched(with indices: [Int]) {
        score += indices.count
        indices.forEach {
            gameCards[$0].isMatched = true
        }
    }
    
    private mutating func deselectCardIfPossible(at index: Int) {
        guard indicesOfFaceUpCards.count < setSize else {
            return
        }
        
        if gameCards[index].hasBeenSeen {
            score -= 1
        }
        gameCards[index].isFaceUp = false
        gameCards[index].hasBeenSeen = true
    }
    
    private mutating func replaceMatchedCardsIfPossible() -> Bool {
        guard indicesOfMatchedCards.count > 0,
              (indicesOfMatchedCards.count % setSize) == 0 else {
            return false
        }
        
        let indicesOfMatchedCards = self.indicesOfMatchedCards
        if contentDeck.count > nextSetIndex {
            let cardContent = contentDeck[nextSetIndex]
            for itemIndex in 0..<setSize {
                let matchedCardIndex = indicesOfMatchedCards[itemIndex]
                let cardId = nextSetIndex * setSize + (setSize - itemIndex - 1)
                gameCards[matchedCardIndex] = Card(id: cardId, content: cardContent)
            }
            nextSetIndex += 1
        } else {
            // Remove cards from the end
            indicesOfMatchedCards.reversed()
                .forEach { gameCards.remove(at: $0) }
        }
        
        return true
    }
    
    struct Card: Identifiable {
        let id: Int
        let content: CardContent
        var hasBeenSeen = false
        var isFaceUp = false
        var isMatched = false
    }
}
