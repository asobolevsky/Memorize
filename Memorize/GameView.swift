//
//  GameView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-08.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            VStack {
                Text("Memorize! (\(viewModel.theme.name))")
                    .font(.largeTitle)
                Text("Score: \(viewModel.score)")
                    .font(.title2)
                CardsGridView(cards: viewModel.cards, didTapCard: { card in
                    viewModel.choose(card)
                })
                .foregroundColor(viewModel.color)
            }
            .padding(.horizontal)
            Button(action: { viewModel.startNewGame() }) {
                Text("New Game")
                    .font(.largeTitle)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame(theme: Themes.vehicles.theme)
        GameView(viewModel: game)
            .preferredColorScheme(.light)
        //        GameView(theme: theme)
        //            .preferredColorScheme(.dark)
        //            .previewLayout(.fixed(width: 2436 / 3.0, height: 1125 / 3.0))
    }
}
