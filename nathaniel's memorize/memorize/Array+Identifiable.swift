//
//  Array+Identifiable.swift
//  memorize
//
//  Created by Nathaniel Veimau (old comp) on 8/19/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for i in 0..<self.count {
            if self[i].id == matching.id {
                return i
            }
        }
        return nil
    }
}
