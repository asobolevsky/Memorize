//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-08.
//

import SwiftUI

struct ContentView: View {
    let cards = [
        Card(emoji: "🚌"),
        Card(emoji: "🚗"),
        Card(emoji: "🚂"),
        Card(emoji: "🚋"),
        Card(emoji: "🚊"),
        Card(emoji: "🚴‍♂️"),
        Card(emoji: "🏃‍♂️"),
        Card(emoji: "🚇"),
    ]
    
    @State var cardsCount = 8
    
    var body: some View {
        VStack {
            CardsGridView(cards: cards, cardsCount: $cardsCount).foregroundColor(.orange)
            Spacer()
            toolbar.padding()
        }
        .padding(.horizontal)
    }
    
    private var toolbar: some View {
        HStack {
            removeButton
            Spacer()
            shuffleButton
            Spacer()
            addButton
        }
        .font(.largeTitle)
    }
    
    private var removeButton: some View {
        Button(action: {
            cardsCount = max(0, cardsCount - 1)
        }) {
            Image(systemName: "minus.circle")
        }
        .disabled(cardsCount == 0)
    }
    
    private var shuffleButton: some View {
        Button(action: {
        }) {
            Text("Shuffle")
        }
    }
    
    private var addButton: some View {
        Button(action: {
            cardsCount = min(cards.count, cardsCount + 1)
        }) {
            Image(systemName: "plus.circle")
        }
        .disabled(cardsCount == cards.count)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 2436 / 3.0, height: 1125 / 3.0))
    }
}
