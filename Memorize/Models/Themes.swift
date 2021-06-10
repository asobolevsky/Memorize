//
//  Themes.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-10.
//

import SwiftUI

struct Theme {
    let name: String
    let color: Color
    let cards: [Card]
}

struct Themes {
    static let vehicles = Theme(name: "Vehicles", color: .red, cards: [
        Card(emoji: "🚌"),
        Card(emoji: "🚗"),
        Card(emoji: "🚂"),
        Card(emoji: "🚋"),
        Card(emoji: "🚊"),
        Card(emoji: "🚴‍♂️"),
        Card(emoji: "🏃‍♂️"),
        Card(emoji: "🚇"),
        Card(emoji: "✈️"),
        Card(emoji: "🏎"),
        Card(emoji: "🛵"),
        Card(emoji: "🛰"),
        Card(emoji: "🚁"),
        Card(emoji: "🚀"),
        Card(emoji: "🛸"),
        Card(emoji: "🛶"),
    ])
    
    static let animals = Theme(name: "Animals", color: .orange, cards: [
        Card(emoji: "🐶"),
        Card(emoji: "🐭"),
        Card(emoji: "🐰"),
        Card(emoji: "🦊"),
        Card(emoji: "🐻"),
        Card(emoji: "🐼"),
        Card(emoji: "🐨"),
        Card(emoji: "🦁"),
        Card(emoji: "🐯"),
        Card(emoji: "🐮"),
        Card(emoji: "🐷"),
        Card(emoji: "🐸"),
        Card(emoji: "🐵"),
        Card(emoji: "🐔"),
        Card(emoji: "🦉"),
        Card(emoji: "🦆"),
    ])
    
    static let fruits = Theme(name: "Fruits", color: .green, cards: [
        Card(emoji: "🍏"),
        Card(emoji: "🍐"),
        Card(emoji: "🍊"),
        Card(emoji: "🍌"),
        Card(emoji: "🍉"),
        Card(emoji: "🍇"),
        Card(emoji: "🍒"),
        Card(emoji: "🍈"),
        Card(emoji: "🍋"),
        Card(emoji: "🍓"),
        Card(emoji: "🫐"),
        Card(emoji: "🍑"),
        Card(emoji: "🥭"),
        Card(emoji: "🍍"),
        Card(emoji: "🥥"),
        Card(emoji: "🥝"),
    ])
    
    static let countries = Theme(name: "Countries", color: .blue, cards: [
        Card(emoji: "🇦🇽"),
        Card(emoji: "🇩🇿"),
        Card(emoji: "🇦🇹"),
        Card(emoji: "🇦🇷"),
        Card(emoji: "🇧🇷"),
        Card(emoji: "🇧🇬"),
        Card(emoji: "🇨🇦"),
        Card(emoji: "🇨🇱"),
        Card(emoji: "🇨🇮"),
        Card(emoji: "🇬🇪"),
        Card(emoji: "🇵🇪"),
        Card(emoji: "🇹🇭"),
        Card(emoji: "🇹🇷"),
        Card(emoji: "🏴󠁧󠁢󠁥󠁮󠁧󠁿"),
        Card(emoji: "🏴󠁧󠁢󠁳󠁣󠁴󠁿"),
        Card(emoji: "🇺🇾"),
    ])
}
