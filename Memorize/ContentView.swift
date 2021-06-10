//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-08.
//

import SwiftUI

struct ContentView: View {
    @State var theme: Theme = Themes.vehicles
    @State var cardsCount = 8
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            CardsGridView(cards: theme.cards, cardsCount: $cardsCount)
                .foregroundColor(theme.color)
            themeButtons
        }
        .padding(.horizontal)
    }
    
    private var themeButtons: some View {
        HStack(spacing: 20) {
            makeThemeButton(with: Themes.vehicles, label: "🚗")
            makeThemeButton(with: Themes.animals, label: "🐶")
            makeThemeButton(with: Themes.fruits, label: "🍏")
            makeThemeButton(with: Themes.countries, label: "🇩🇿")
        }
        .padding(.horizontal)
    }
    
    private func makeThemeButton(with newTheme: Theme, label: String) -> some View {
        Button(action: { theme = newTheme }) {
            ZStack {
                Circle().stroke()
                Text(label)
            }
        }
        .font(.largeTitle)
        .aspectRatio(1, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let theme = Theme(name: "Test", color: .gray, cards: [
        Card(emoji: "🚌"),
        Card(emoji: "🚗"),
        Card(emoji: "🚂"),
        Card(emoji: "🚋"),
        Card(emoji: "🚊"),
        Card(emoji: "🚴‍♂️"),
        Card(emoji: "🏃‍♂️"),
        Card(emoji: "🚇"),
    ])
    
    static var previews: some View {
        ContentView(theme: theme)
            .preferredColorScheme(.light)
        ContentView(theme: theme)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 2436 / 3.0, height: 1125 / 3.0))
    }
}
