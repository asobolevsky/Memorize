//
//  AdaptableGridView.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-23.
//

import SwiftUI

struct AdaptableGridView<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat
    @ViewBuilder var content: (Item) -> ItemView
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let width = widthThatFits(itemCount: items.count, in: geometry.size, itemAspectRation: aspectRatio)
                let columns = [ adaptiveGridItem(width: width) ]
                LazyVGrid(columns: columns, spacing: .itemViewSpacing) {
                    ForEach(items) { item in
                        content(item)
                            .aspectRatio(aspectRatio, contentMode: .fit)
                    }
                }
                Spacer(minLength: 0)
            }
        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = .itemViewSpacing
        return gridItem
    }
    
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRation: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspectRation
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        columnCount = min(columnCount, itemCount)
        return floor(size.width / CGFloat(columnCount))
    }
}

private extension CGFloat {
    static let itemViewSpacing: CGFloat = 0
}
