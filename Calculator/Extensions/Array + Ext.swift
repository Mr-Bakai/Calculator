//
//  Array + Ext.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation

extension Array {
    func firstRange(where closure: (Element) -> Bool) -> Range<Int>? {
        guard var index = firstIndex(where: closure) else { return nil }
        var indexes = [Int]()
        while index < count && closure(self[index]) {
            indexes.append(index)
            index += 1
        }
        if indexes.isEmpty { return nil }
        return Range<Int>(indexes.min()!...indexes.max()!)
    }
}
