//
//  Themes.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-10.
//

import SwiftUI

struct Theme: Identifiable {
    var id: String {
        return name
    }
    let name: String
    let color: Color
    let iconName: String
    let emojis: [String]
}

enum Themes: CaseIterable {
    case vehicles
    case animals
    case fruits
    case countries
    
    var theme: Theme {
        switch self {
        case .vehicles:
            return Theme(name: "Vehicles", color: .red, iconName: "car", emojis: [
                "🚌", "🚗", "🚂", "🚋", "🚊", "🚴‍♂️", "🏃‍♂️", "🚇",
                "✈️", "🏎", "🛵", "🛰", "🚁", "🚀", "🛸", "🛶",
            ])
            
        case .animals:
            return Theme(name: "Animals", color: .orange, iconName: "tortoise", emojis: [
                "🐶", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🦁",
                "🐯", "🐮", "🐷", "🐸", "🐵", "🐔", "🦉", "🦆",
            ])
            
        case .fruits:
            return Theme(name: "Fruits", color: .green, iconName: "leaf", emojis: [
                "🍏", "🍐", "🍊", "🍌", "🍉", "🍇", "🍒", "🍈",
                "🍋", "🍓", "🫐", "🍑", "🥭", "🍍", "🥥", "🥝",
            ])
            
        case .countries:
            return Theme(name: "Countries", color: .blue, iconName: "globe", emojis: [
                "🇦🇽", "🇩🇿", "🇦🇹", "🇦🇷", "🇧🇷", "🇧🇬", "🇨🇦", "🇨🇱",
                "🇨🇮", "🇬🇪", "🇵🇪", "🇹🇭", "🇹🇷", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇺🇾",
            ])
        }
    }
}
