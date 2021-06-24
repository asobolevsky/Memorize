//
//  Array+Additions.swift
//  Memorize
//
//  Created by Aleksei Sobolevskii on 2021-06-23.
//

import Foundation

extension Array {
    
    var oneAndOnly: Element? {
        guard count == 1 else {
            return nil
        }
        return first
    }
    
    subscript(indices: Int...) -> [Element] {
        var result = [Element]()
        for idx in indices {
            result.append(self[idx])
        }
        return result
    }
    
}
