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
            VStack {
            Text("Memorize!")
                .font(.largeTitle)
            CardsGridView(emojis: theme.emojis.shuffled(), cardsCount: $cardsCount)
                .foregroundColor(theme.color)
            }
            .padding(.horizontal)
            themeButtons
        }
    }
    
    private var themeButtons: some View {
        HStack {
            Spacer()
            makeThemeButton(with: Themes.vehicles, iconName: "car")
            Spacer()
            makeThemeButton(with: Themes.animals, iconName: "tortoise")
            Spacer()
            makeThemeButton(with: Themes.fruits, iconName: "leaf")
            Spacer()
            makeThemeButton(with: Themes.countries, iconName: "globe")
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private func makeThemeButton(with newTheme: Theme, iconName: String) -> some View {
        Button(action: { theme = newTheme }) {
            VStack {
                Image(systemName: iconName)
                    .font(.title)
                Spacer()
                Text(newTheme.name)
                    .font(.footnote)
            }
        }
        .frame(height: 54)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let theme = Theme(name: "Test", color: .gray, emojis: [ "🚌", "🚗", "🚂", "🚋", "🚊", "🚴‍♂️", "🏃‍♂️", "🚇", ])
    
    static var previews: some View {
        ContentView(theme: theme)
            .preferredColorScheme(.light)
        ContentView(theme: theme)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 2436 / 3.0, height: 1125 / 3.0))
    }
}
