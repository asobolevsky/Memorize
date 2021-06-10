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
    let emojis: [String]
}

struct Themes {
    static let vehicles = Theme(name: "Vehicles", color: .red, emojis: [
        "🚌", "🚗", "🚂", "🚋", "🚊", "🚴‍♂️", "🏃‍♂️", "🚇",
        "✈️", "🏎", "🛵", "🛰", "🚁", "🚀", "🛸", "🛶",
    ])
    
    static let animals = Theme(name: "Animals", color: .orange, emojis: [
        "🐶", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🦁",
        "🐯", "🐮", "🐷", "🐸", "🐵", "🐔", "🦉", "🦆",
    ])
    
    static let fruits = Theme(name: "Fruits", color: .green, emojis: [
        "🍏", "🍐", "🍊", "🍌", "🍉", "🍇", "🍒", "🍈",
        "🍋", "🍓", "🫐", "🍑", "🥭", "🍍", "🥥", "🥝",
    ])
    
    static let countries = Theme(name: "Countries", color: .blue, emojis: [
        "🇦🇽", "🇩🇿", "🇦🇹", "🇦🇷", "🇧🇷", "🇧🇬", "🇨🇦", "🇨🇱",
        "🇨🇮", "🇬🇪", "🇵🇪", "🇹🇭", "🇹🇷", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇺🇾",
    ])
}
