//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-08.
//

import SwiftUI


let defaultSettings = GameSettings(theme: Themes.vehicles.theme)

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame(theme: defaultSettings.theme)
    
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: game)
        }
    }
}
