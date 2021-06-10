//
//  CardsGridView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-09.
//

import SwiftUI

struct CardsGridView: View {
    var emojis: [String]
    @Binding var cardsCount: Int
    
    var body: some View {
        ScrollView {
            let gridItems = [ GridItem(.adaptive(minimum: .minCardWidth)) ]
            LazyVGrid(columns: gridItems) {
                ForEach(emojis[0..<cardsCount], id: \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
}

struct CardsGridView_Previews: PreviewProvider {
    static let emojis = [ "🚌", "🚗", "🚂", "🚋", "🚊", "🚴‍♂️", "🏃‍♂️", "🚇", ]
    
    static var previews: some View {
        CardsGridView(emojis: emojis, cardsCount: .constant(4))
    }
}

private extension CGFloat {
    static let minCardWidth: CGFloat = 70
}
