//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-10.
//

import SwiftUI

typealias Card = MemoryGame<String>.Card

let defaultNumberOfPairs = 4
let defaultTheme = Themes.vehicles.theme
let defaultSettings = GameSettings(numberOfPairs: defaultNumberOfPairs, theme: defaultTheme)

class EmojiMemoryGame: ObservableObject {
    
    // MARK: - Private vars
    
    @Published private var model = createMemoryGame()
    
    // MARK: - Public vars
    
    var settings: GameSettings = defaultSettings {
        didSet {
            updateModel(with: settings)
        }
    }
    
    var cards: [Card] {
        return model.cards
    }
    
    // MARK: - Private
    
    private func updateModel(with settings: GameSettings) {
        model = EmojiMemoryGame.createMemoryGame(with: settings)
    }
    
    private static func createMemoryGame(with settings: GameSettings = defaultSettings) -> MemoryGame<String> {
        return MemoryGame<String>(cardPairsNumber: settings.numberOfPairs) { idx in
            let theme = settings.theme
            var finalIdx = idx
            if idx >= theme.emojis.count {
                finalIdx = idx % theme.emojis.count
            }
            return theme.emojis[finalIdx]
        }
    }
    
    // MARK: - Intents
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
