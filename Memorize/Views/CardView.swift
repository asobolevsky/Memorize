//
//  CardView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-09.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: .cardCornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: .cardBorderWidth)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            self.isFaceUp = !isFaceUp
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "🚂")
            .previewLayout(.sizeThatFits)
        CardView(content: "🚌", isFaceUp: false)
    }
}

private extension CGFloat {
    static let cardCornerRadius: CGFloat = 25.0
    static let cardBorderWidth: CGFloat = 3.0
}
