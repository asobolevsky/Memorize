//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-08.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            VStack {
            Text("Memorize!")
                .font(.largeTitle)
                CardsGridView(cards: viewModel.cards, didTapCard: { card in
                    viewModel.choose(card)
                })
                    .foregroundColor(viewModel.settings.theme.color)
            }
            .padding(.horizontal)
            ThemeSelectView(currentTheme: $viewModel.settings.theme)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
//        ContentView(theme: theme)
//            .preferredColorScheme(.dark)
//            .previewLayout(.fixed(width: 2436 / 3.0, height: 1125 / 3.0))
    }
}
