//
//  Themes.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-10.
//

import Foundation

struct Theme: Identifiable {
    var id: String {
        return name
    }
    let name: String
    let colorHex: String
    let iconName: String
    let emojis: [String]
    let numberOfPairs: Int
}

enum Themes: CaseIterable {
    case vehicles
    case animals
    case fruits
    case countries
    case food
    case weather
    
    var theme: Theme {
        switch self {
        case .vehicles:
            return Theme(name: "Vehicles", colorHex: "F43B30", iconName: "car", emojis: [
                "🚌", "🚗", "🚂", "🚋", "🚊", "🚴‍♂️"
//                "🚌", "🚗", "🚂", "🚋", "🚊", "🚴‍♂️", "🏃‍♂️", "🚇",
//                "✈️", "🏎", "🛵", "🛰", "🚁", "🚀", "🛸", "🛶",
            ], numberOfPairs: 6)
            
        case .animals:
            return Theme(name: "Animals", colorHex: "FF9500", iconName: "tortoise", emojis: [
                "🐶", "🐭", "🐰", "🦊", "🐻", "🐼"
//                "🐶", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🦁",
//                "🐯", "🐮", "🐷", "🐸", "🐵", "🐔", "🦉", "🦆",
            ], numberOfPairs: 6)
            
        case .fruits:
            return Theme(name: "Fruits", colorHex: "35C759", iconName: "leaf", emojis: [
                "🍋", "🍓", "🫐", "🍑"
//                "🍏", "🍐", "🍊", "🍌", "🍉", "🍇", "🍒", "🍈",
//                "🍋", "🍓", "🫐", "🍑", "🥭", "🍍", "🥥", "🥝",
            ], numberOfPairs: 4)
            
        case .countries:
            return Theme(name: "Countries", colorHex: "007AFF", iconName: "globe", emojis: [
                "🇦🇽", "🇩🇿", "🇦🇹", "🇦🇷", "🇧🇷", "🇧🇬", "🇨🇦", "🇨🇱",
//                "🇦🇽", "🇩🇿", "🇦🇹", "🇦🇷", "🇧🇷", "🇧🇬", "🇨🇦", "🇨🇱",
//                "🇨🇮", "🇬🇪", "🇵🇪", "🇹🇭", "🇹🇷", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇺🇾",
            ], numberOfPairs: 8)
            
        case .food:
            return Theme(name: "Food", colorHex: "FECC02", iconName: "fork.knife", emojis: [
                "🍕", "🍔", "🌭", "🌮",
            ], numberOfPairs: 4)
                
        case .weather:
            return Theme(name: "Weather", colorHex: "007AFF", iconName: "sun.min.fill", emojis: [
                "☀️", "🌧", "⛅️",
            ], numberOfPairs: 3)
        }
    }
}
