//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-10.
//

import SwiftUI

typealias Card = MemoryGame<String>.Card

class EmojiMemoryGame: ObservableObject {
    
    // MARK: - Private vars
    
    @Published private var model: MemoryGame<String>
    
    // MARK: - Public vars
    
    var theme: Theme
    
    var cards: [Card] {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    var color: Color {
        return Color(hex: theme.colorHex)
    }
    
    init(theme: Theme) {
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    // MARK: - Private
    
    private func updateModel(with theme: Theme) {
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    private static func prepareEmojis(with emojis: [String]) -> [String] {
        let emojisSet = Set(emojis)
        var uniqueEmojis = Array(emojisSet)
        uniqueEmojis.shuffle()
        return uniqueEmojis
    }
    
    private static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        // Ensuring all the emojis are unique
        let emojis = prepareEmojis(with: theme.emojis)
        let numberOfPairs = min(theme.numberOfPairs, emojis.count)
        return MemoryGame<String>(cardPairsNumber: numberOfPairs) { idx in
            var finalIdx = idx
            if idx >= emojis.count {
                finalIdx = idx % emojis.count
            }
            return emojis[finalIdx]
        }
    }
    
    // MARK: - Intents
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func startNewGame() {
        guard let randomTheme = Themes.allCases.randomElement() else {
            return
        }
        
        theme = randomTheme.theme
        updateModel(with: theme)
    }
    
}
