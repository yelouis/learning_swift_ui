//
//  Array+Identifiable.swift
//  memorize
//
//  Created by Louis Ye on 7/16/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == matching.id{
                return index
            }
        }
        return 0
    }
}
