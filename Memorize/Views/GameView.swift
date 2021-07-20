//
//  GameView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-08.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            VStack {
                Text("Memorize! (\(game.theme.name))")
                    .font(.largeTitle)
                Text("Score: \(game.score)")
                    .font(.title2)
                AdaptableGridView(items: game.cards, aspectRatio: .cardAspectRatio) { index, card in
                    cardView(index: index, card: card)
                }
                .foregroundColor(game.color)
            }
            .padding(.horizontal)
            Button(action: { game.startNewGame() }) {
                Text("New Game")
                    .font(.largeTitle)
            }
        }
    }
    
    @ViewBuilder
    private func cardView(index: Int, card: Card) -> some View {
        CardView(index: index, card: card)
            .padding(.cardPadding)
            .onTapGesture {
                game.choose(card)
            }
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame(theme: Themes.vehicles.theme)
        game.choose(game.cards.first!)
        return GameView(game: game)
            .preferredColorScheme(.light)
        //        GameView(theme: theme)
        //            .preferredColorScheme(.dark)
        //            .previewLayout(.fixed(width: 2436 / 3.0, height: 1125 / 3.0))
    }
}

private extension CGFloat {
    static let cardAspectRatio: CGFloat = 2/3
    static let cardPadding: CGFloat = 4
}
