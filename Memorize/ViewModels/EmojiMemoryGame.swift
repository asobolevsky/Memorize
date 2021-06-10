//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-10.
//

import SwiftUI

typealias Card = MemoryGame<String>.Card

class EmojiMemoryGame {
    
    // MARK: - Private vars
    
    private lazy var model: MemoryGame<String> = createMemoryGame(for: currentTheme)
    
    // MARK: - Public vars
    
    var currentTheme: Theme = Themes.vehicles {
        didSet {
            updateModel()
        }
    }
    
    var cards: [Card] {
        return model.cards
    }
    
    // MARK: - Private
    
    private func updateModel() {
        model = createMemoryGame(for: currentTheme)
    }
    
    private func createMemoryGame(for theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(cardPairsNumber: 4) { idx in
            var finalIdx = idx
            if idx >= theme.emojis.count {
                finalIdx = idx % theme.emojis.count
            }
            return theme.emojis[finalIdx]
        }
    }
}
